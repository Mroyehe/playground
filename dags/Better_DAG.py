from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.python import get_current_context


import requests
import json
import pandas as pd
import pyodbc

def pull_data_from_api():
    API_KEY = '4405115583184f844e23391c97c202ebe982607a0df9a400fe2fa6fedc094a43'
    response_API = requests.get(f'https://apiv3.apifootball.com/?action=get_countries&APIkey={API_KEY}')
    data = response_API.text
    parse_json = json.loads(data)
    return parse_json


def insert_data_to_sql():
    server = 'LAPTOP-L24U747I\SQLEXPRESS'
    database = 'Better_DB'
    cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER=' + server + ';DATABASE=' + database + ';Trusted_Connection=yes;')
    cursor = cnxn.cursor()
    context = get_current_context()
    parse_json = context['ti'].xcom_pull(task_ids='pull_data_from_api', key='return_value')
    data_df = pd.json_normalize(parse_json)
    for index, row in data_df.iterrows():
        cursor.execute("INSERT INTO API_TEST (country_id,country_name,country_logo) values(?,?,?)", row.country_id,
                       row.country_name, row.country_logo)
    cnxn.commit()
    cursor.close()
    return 'Done'

dag = DAG('Better_DAG', description='Better_DAG',
          schedule_interval='0 12 * * *',
          start_date=datetime(2017, 3, 20), catchup=False, render_template_as_native_obj=True)

pull_data_from_api = PythonOperator(task_id='pull_data_from_api', python_callable=pull_data_from_api, dag=dag)

insert_data_to_sql= PythonOperator(task_id='insert_data_to_sql', python_callable=insert_data_to_sql, dag=dag)

pull_data_from_api >> insert_data_to_sql
