import pandas as pd 
import numpy as np 

import os

import matplotlib.pyplot as plt
import seaborn as sns

import missingno as msno


# Function for initial basic exploration
def basic_exploration(df):
    rows, columns = df.shape
    print("What is the shape (dimensions) of the dataframe?")
    display(f'The dataframe has {rows} rows and {columns} columns')
    print('-'*100)

    print('What are the first five rows of the dataframe?')
    display(df.head())
    print('-'*100)

    print('What is a random sample of 5 rows from the dataframe?')
    display(df.sample(5, random_state=546))
    print('-'*100)

    print('What are the column names of the dataframe?')
    display(df.columns.to_list())
    print('-'*100)

    print('What is the data type of each column?')
    display(df.dtypes)
    print('-'*100)

    print('How many columns are there for each data type?')
    display(df.dtypes.value_counts())
    print('-'*100)

    print('What is the information summary of the dataframe?')
    display(df.info())
    print('-'*100)

    print('What are the descriptive statistics of each column?')
    display(df.describe(include='all').astype(str).replace('nan', ''))
    print('-'*100)

    print('How many unique values does each column have?')
    display(df.nunique().sort_values())
    print('-' * 100)

    print('What are the unique values of each column?')
    df_unique_values = pd.DataFrame(df.apply(lambda x: x.unique()))
    display(df_unique_values)
    print('-' * 100)

# Null values exploration
def null_exploration(df):
    print('How many null values does each column have?')
    display(df.isna().sum().sort_values(ascending=False))
    print('-' * 100)

    print('What is the percentage of null values per column?')
    df_nulls = df.isnull().sum().div(len(df)).mul(100).round(2).reset_index().rename(columns = {'index': 'Column', 0: 'Percentage'})
    df_nulls = df_nulls.sort_values(by = 'Percentage', ascending=False).reset_index(drop = True)
    display(df_nulls)
    print('-' * 100)

    print('Visualization of null values:')
    msno.bar(df, figsize = (6, 3), fontsize= 9)
    plt.show()
    print('-' * 100)

    print('Visualization of the null values pattern:')
    msno.matrix(df, figsize = (6, 3), fontsize= 9, sparkline = False)
    plt.show()
    print('-' * 100)

# Extract date
def extract_date(df):
    mes_dia = df['Events'].split()[-1].replace('.','/').replace('(', '').replace(')', '')
    fecha = mes_dia + '/' + str(df['Year'])
    return fecha

# Extract last name
def extract_last_name(text):
    compound_last_names = ['Reyes Martínez', 'Toko Kegne', 'Van Bellinghen', 'Brachi García', 'Mata Pérez', 'Marie Schweizer',
                           'Hernández Mendoza', 'Sánchez López', 'Han Yüksel', 'Ruiz Velasco', 'García Rincón', 'Anette Waaler',
                           'Marie Schweizer']
    words = text.split()
    if any(last_name in text for last_name in compound_last_names):
        return ' '.join(words[1:3])
    else:
        return words[1]

# Extract country
def extract_country(text):
    if 'United Kingdom' in text:
        return 'UK'
    else:
        return text.split()[-1]
    




# translate to english

def translate_countries_in_cell(text, dictionary):
    if pd.isna(text):
        return text
    
    # Convert to string for safety
    text_str = str(text)
    
    # Look for each country in Spanish within the text and replace it with its translation
    for country_es, country_en in dictionary.items():
        if country_es in text_str:
            # Replace the country in Spanish with the English one
            text_str = text_str.replace(country_es, country_en)
            
    # Optional: Clean up annoying HTML codes like '&nbsp;' if any remnants remain
    text_str = text_str.replace('&nbsp;', ' ').replace('\xa0', ' ')
    
    return text_str

###########################################

def translate(x):
    
    # country translation
    country_translations = {
        'Italia': 'Italy',
        'Bielorrusia': 'Belarus',
        'Francia': 'France',
        'Bulgaria': 'Bulgaria',
        'Armenia': 'Armenia',
        'Ucrania': 'Ukraine',
        'Georgia': 'Georgia',
        'Turquía': 'Turkey',
        'Rumania': 'Romania',
        'Polonia': 'Poland',
        'Letonia': 'Latvia',
        'Rusia': 'Russia',
        'Alemania': 'Germany',
        'Azerbaiyán': 'Azerbaijan',
        'Reino Unido': 'United Kingdom',
        'Suecia': 'Sweden',
        'Noruega': 'Norway',
        'AIN': 'AIN',  # Individual Neutral Athletes
        'Albania': 'Albania',
        'España': 'Spain',
        'Bélgica': 'Belgium',
        'Moldavia': 'Moldova',
        'Israel': 'Israel',
        'Austria': 'Austria',
        'Serbia': 'Serbia',
        'Irlanda': 'Ireland',
        'Finlandia': 'Finland'
    }

    medal_columns = ['Gold', 'Silver', 'Bronze']
    for col in medal_columns:
        x[col] = x[col].apply(lambda y: translate_countries_in_cell(y, country_translations))



    