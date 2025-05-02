from fastapi import FastAPI
from models import Student
import crud

app = FastAPI()

@app.post("/students")
def add_student(student: Student):
    crud.create_student(student)
    return {"message": "Student created"}

@app.get("/students")
def list_students():
    return crud.get_students()
