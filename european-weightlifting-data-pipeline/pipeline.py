# pipeline.py
import pandas as pd
import functions as fpf

MEDAL_ORDER = ['Gold', 'Silver', 'Bronze']
FINAL_COLUMNS = ['Gender', 'Category', 'Date', 'Medal', 'Name',
                 'Last Name', 'Country', 'Snatch', 'Clean and Jerk', 'Total']


def _category_sort_key(cat):
    """'87' -> (87, False); '+87' -> (87, True), so +87 sorts after 87."""
    return (int(cat.lstrip('+')), cat.startswith('+'))


def clean_results(df_raw: pd.DataFrame) -> pd.DataFrame:
    """Turn raw wide results (Events, Gold, Silver, Bronze, Year, Gender)
    into one clean row per medal. Works for any number of seasons."""
    # 1. wide -> long: one row per medal
    df = df_raw.melt(id_vars=['Events', 'Year', 'Gender'],
                     var_name='Medal', value_name='Athlete')

    # 2. remove footnote-style annotations such as [2] or [n 1]
    df['Athlete'] = (df['Athlete']
                     .str.replace(r'\[\d\]', '', regex=True)
                     .str.replace(r'\[.\s*\d+\]', '', regex=True))

    # 3. date and weight category, both from the event string ('+109 kg (13.04)')
    df['Date'] = pd.to_datetime(df.apply(fpf.extract_date, axis=1), format='%d/%m/%Y')
    df['Category'] = df['Events'].str.extract(r'^\s*(\+?\d+)')[0]  # keeps the '+'

    # 4. free-text athlete string -> name, last name, country
    info = df['Athlete'].str.extract(r'^(.*?)(?=\s*\d)')[0]
    df['Name'] = info.str.split().str.get(0)
    df['Last Name'] = info.apply(fpf.extract_last_name)
    df['Country'] = info.apply(fpf.extract_country)

    # 5. lifts: 'snatch + clean and jerk = total'
    lifts = df['Athlete'].str.extract(r'(\d+)\s*\+\s*(\d+)\s*=\s*(\d+)')
    if lifts.isna().any().any():
        bad = df.loc[lifts.isna().any(axis=1), ['Events', 'Year', 'Athlete']]
        raise ValueError(f'{len(bad)} rows without a parsable result:\n{bad.head()}')
    df[['Snatch', 'Clean and Jerk', 'Total']] = lifts.apply(pd.to_numeric).astype('int64')

    # 6. types and sorting
    categories = sorted(df['Category'].unique(), key=_category_sort_key)
    df['Category'] = pd.Categorical(df['Category'], categories=categories, ordered=True)
    df['Medal'] = pd.Categorical(df['Medal'], categories=MEDAL_ORDER, ordered=True)
    df = df.astype({'Date': 'datetime64[ns]'})

    return (df[FINAL_COLUMNS]
            .sort_values(['Gender', 'Category', 'Date', 'Medal'], ignore_index=True))


def validate_results(df: pd.DataFrame, n_seasons: int) -> None:
    """Integrity checks on the cleaned dataset. Raises AssertionError if any fails."""
    # 1. no missing values and no duplicated medals
    assert df.isna().sum().sum() == 0, 'Missing values found'
    assert not df.duplicated(['Gender', 'Category', 'Date', 'Medal']).any(), 'Duplicated medals'

    # 2. expected structure: 10 categories x 2 genders x 3 medals per season
    assert len(df) == n_seasons * 60, f'Expected {n_seasons * 60} medals, found {len(df)}'
    assert (df.groupby(['Gender', 'Category'], observed=True).size() == n_seasons * 3).all(), \
        'Each weight category should have 3 medals per season'
   
    assert df.groupby('Gender')['Category'].nunique().eq(10).all(), 'Each gender needs 10 categories'

    # 3. internal consistency of the lifts
    assert (df['Total'] == df['Snatch'] + df['Clean and Jerk']).all(), 'Total != Snatch + Clean and Jerk'
    assert (df[['Snatch', 'Clean and Jerk', 'Total']] > 0).all().all(), 'Non-positive lift found'