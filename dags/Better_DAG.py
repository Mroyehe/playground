from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.python import get_current_context


import requests
import json
import pandas as pd
import pyodbc
API_KEY = '828d6b60fb7e5b7f396806a392ff33a5798572fbe141e767df18df05277e2415' #'4405115583184f844e23391c97c202ebe982607a0df9a400fe2fa6fedc094a43'

def pull_data_from_api():
    response_API = requests.get(f'https://apiv3.apifootball.com/?action=get_leagues&APIkey={API_KEY}')
    data = response_API.json()
    print(data)
    return data


def insert_data_to_sql():
    server = 'LAPTOP-L24U747I\SQLEXPRESS'
    database = 'Better_DB_v2'
    cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER=' + server + ';DATABASE=' + database + ';Trusted_Connection=yes;')
    cursor = cnxn.cursor()
    context = get_current_context()
    data = context['ti'].xcom_pull(task_ids='pull_data_from_api', key='return_value')
    parse_json=json.dumps(data)

    #data_df = pd.json_normalize(parse_json)
    #for index, row in data_df.iterrows():
    cursor.execute("INSERT INTO dim_Competitions values(?)", (parse_json,))
    cnxn.commit()
    cursor.close()
    return 'Done'

dag = DAG('Better_DAG', description='Better_DAG',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False, render_template_as_native_obj=True)

pull_data_from_api = PythonOperator(task_id='pull_data_from_api', python_callable=pull_data_from_api, dag=dag)

insert_data_to_sql= PythonOperator(task_id='insert_data_to_sql', python_callable=insert_data_to_sql, dag=dag)

pull_data_from_api >> insert_data_to_sql
