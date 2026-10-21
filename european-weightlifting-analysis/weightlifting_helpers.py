import pandas as pd 
import numpy as np 

import os

import matplotlib.pyplot as plt
import seaborn as sns

import missingno as msno


# Initial data exploration
def exploracion_basica(df):
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

    print('What are the column names?')
    display(df.columns.to_list())
    print('-'*100)

    print('What is the data type of each column?')
    display(df.dtypes)
    print('-'*100)

    print('How many columns are there for each data type?')
    display(df.dtypes.value_counts())
    print('-'*100)

    print('What is the dataframe information summary?')
    display(df.info())
    print('-'*100)

    print('What are the descriptive statistics for each column?')
    display(df.describe(include='all').astype(str).replace('nan', ''))
    print('-'*100)

    print('How many unique values does each column contain?')
    display(df.nunique().sort_values())
    print('-' * 100)

    print('What unique values does each column contain?')
    df_unique_values = pd.DataFrame(df.apply(lambda x: x.unique()))
    display(df_unique_values)
    print('-' * 100)

    # Missing-value exploration
def exploracion_nulos(df):
    print('How many missing values does each column contain?')
    display(df.isna().sum().sort_values(ascending=False))
    print('-' * 100)

    print('What percentage of values is missing in each column?')
    df_nulls = df.isnull().sum().div(len(df)).mul(100).round(2).reset_index().rename(columns = {'index': 'Col', 0: 'pct'})
    df_nulls = df_nulls.sort_values(by = 'pct', ascending=False).reset_index(drop = True)
    display(df_nulls)
    print('-' * 100)

    print('Missing-value visualization:')
    msno.bar(df, figsize = (6, 3), fontsize= 9)
    plt.show()
    print('-' * 100)

    print('Missing-value pattern visualization:')
    msno.matrix(df, figsize = (6, 3), fontsize= 9, sparkline = False)
    plt.show()
    print('-' * 100)

# Extract date
def extraer_fecha(df):
    mes_dia = df['Eventos'].split()[-1].replace('.','/').replace('(', '').replace(')', '')
    fecha = mes_dia + '/' + str(df['Año'])
    return fecha

# Extract surname
def extraer_apellido(texto):
    apellidos_compuestos = ['Reyes Martínez', 'Toko Kegne', 'Van Bellinghen', 'Brachi García', 'Mata Pérez', 'Marie Schweizer',
                            'Hernández Mendoza', 'Sánchez López', 'Han Yüksel', 'Ruiz Velasco', 'García Rincón', 'Anette Waaler',
                            'Marie Schweizer']
    palabras = texto.split()
    if any(apellido in texto for apellido in apellidos_compuestos):
        return ' '.join(palabras[1:3])
    else:
        return palabras[1]

# Extract country
def extraer_pais(texto):
    if 'Reino Unido' in texto:
        return 'Reino Unido'
    else:
        return texto.split()[-1]