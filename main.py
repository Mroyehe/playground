import json
import pyodbc

import api_football


def insert_json_to_sql(conn, json_data, table_name):
    # convert json object to string
    json_string = json.dumps(json_data)

    # Call SP and trap Error if raised
    try:
        cursor = conn.cursor()
        # call sql server procedure with one parameter
        # cursor.execute('EXEC prcInsertEmployees')
        with open(f'sql_procedures/insert_into_{table_name.lower()}.sql', 'r') as fd:
            proc_script = fd.read()
        cursor.execute(proc_script)

        cursor.execute(f'EXEC INSERT_INTO_{table_name} @json = ?', json_string)
        print('inserted data')

    except pyodbc.Error as err:
        print('Error !!!!! %s' % err)
    except Exception as e:
        print(f'something else failed miserably: {e}')

    conn.close()
    print('closed db connection')


if __name__ == '__main__':
    conn = pyodbc.connect(
        'Driver={SQL Server};Server=localhost\SQLEXPRESS;Database=Better_DB_v2;Trusted_Connection=yes;')
    conn.timeout = 60
    conn.autocommit = True

    a = api_football.Competitions()
    r = a.get()
    insert_json_to_sql(conn=conn, json_data=r, table_name='DIM_COMPETITIONS')

    print(r)