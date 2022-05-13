import pyodbc
import json
import requests

API_KEY = '828d6b60fb7e5b7f396806a392ff33a5798572fbe141e767df18df05277e2415'


def get_data_from_api(action_name, additional_headers=''):
    response_api = requests.get(
        f'https://apiv3.apifootball.com/?action={action_name}&APIkey={API_KEY}{additional_headers}')
    print(response_api.json())
    return response_api.json()


def insert_json_2_sql(conn, json_data, table_name):
    # convert json object to string
    json_string = json.dumps(json_data)

    # Call SP and trap Error if raised
    try:
        cursor = conn.cursor()
        # call sql server procedure with one parameter
        # cursor.execute('EXEC prcInsertEmployees')
        cursor.execute(f'EXEC INSERT_INTO_{table_name} @json = ?', json_string)
        print('inserted data')

    except pyodbc.Error as err:
        print('Error !!!!! %s' % err)
    except Exception:
        print('something else failed miserably')

    conn.close()
    print('closed db connection')


def main():
    dim_competitions_data = get_data_from_api(action_name='get_leagues')
    # write json data to file - temporary to not overload API
    # with open("dim_Competitions_data.json", "w", encoding='utf-8') as file1:
    #     file1.write(json.dumps(dim_competitions_data))

    conn = pyodbc.connect(
        'Driver={SQL Server};Server=localhost\SQLEXPRESS;Database=Better_DB_v2;Trusted_Connection=yes;')
    conn.timeout = 60
    conn.autocommit = True

    # # read json data from file - temporary to not overload API
    # with open("dim_Competitions_data.json", "r", encoding='utf-8') as read_file:
    #     dim_Competitions_data = json.load(read_file)

    insert_json_2_sql(conn=conn, json_data=dim_competitions_data, table_name='DIM_COMPETITIONS')


if __name__ == '__main__':
    main()
