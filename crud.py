from db import get_connection

def create_student(student):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO students (name, email, age) VALUES (%s, %s, %s)",
        (student.name, student.email, student.age)
    )
    conn.commit()
    cursor.close()
    conn.close()

def get_students():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM students")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result

# You can add update_student, delete_student, and similar course/enrollment functions
