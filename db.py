import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="your_mysql_user",
        password="your_mysql_password",
        database="student_portal"
    )
