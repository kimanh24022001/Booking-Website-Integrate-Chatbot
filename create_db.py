import mysql.connector
mydb=mysql.connector.connect(
    host='localhost',
    user='root',
    passwd='Kimanh.12',
    database='user',
)
my_cursor=mydb.cursor()
#my_cursor.execute('CREATE DATABASE us')
my_cursor.execute("select * from booking")
for db in my_cursor:
    print(db) 