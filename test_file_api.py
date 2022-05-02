import requests
import json
import pandas as pd

#API_KEY = '4405115583184f844e23391c97c202ebe982607a0df9a400fe2fa6fedc094a43'
#response_API = requests.get(f'https://apiv3.apifootball.com/?action=get_countries&APIkey={API_KEY}')
#print(response_API.status_code)
#data = response_API.text

parse_json=[{'country_id': '44', 'country_name': 'England', 'country_logo': 'https://apiv3.apifootball.com/badges/logo_country/44_england.png'}, {'country_id': '3', 'country_name': 'France', 'country_logo': 'https://apiv3.apifootball.com/badges/logo_country/3_france.png'}]
#parse_json = json.loads(data)
#print(parse_json)


df = pd.json_normalize(parse_json)
print(df)

import pyodbc
server = 'LAPTOP-L24U747I\SQLEXPRESS'
database = 'Better_DB'
cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = cnxn.cursor()
for index, row in df.iterrows():
     cursor.execute("INSERT INTO API_TEST (country_id,country_name,country_logo) values(?,?,?)", row.country_id, row.country_name, row.country_logo)
cnxn.commit()
cursor.close()
