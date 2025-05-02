# 🎓 Student Portal API

This is a simple CRUD API for managing students and their course enrollments using **FastAPI** and **MySQL**.

## 🚀 Features

- Manage Students
- Manage Courses
- Assign Students to Courses
- Full CRUD operations
- RESTful API design
- Swagger documentation

---

## 🛠️ Tech Stack

- **Backend**: Python, FastAPI
- **Database**: MySQL
- **ORM/DB Access**: `mysql-connector-python`

---

## 🗃️ Database Schema

### Tables

#### `students`
| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto-incremented ID |
| name | VARCHAR(100) | Student name |
| email | VARCHAR(100) | Unique email |
| age | INT | Student age |

#### `courses`
| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto-incremented ID |
| title | VARCHAR(100) | Course title |
| description | TEXT | Course description |

#### `enrollments`
| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto-incremented ID |
| student_id | INT (FK) | Refers to `students.id` |
| course_id | INT (FK) | Refers to `courses.id` |

---

## 📦 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/student-portal-api.git
cd student-portal-api


### 2. Install Dependencies

pip install fastapi uvicorn mysql-connector-python

### 3. Set Up MySQL Database

CREATE DATABASE student_portal;

-- Then run the schema from `schema.sql` or manually:
-- Use the SQL shown in the README to create tables

Update db.py with your MySQL credentials:

# db.py
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="your_mysql_user",
        password="your_mysql_password",
        database="student_portal"
    )

### 4. Run the API Server

uvicorn main:app --reload

Visit http://localhost:8000/docs to interact with the Swagger UI.
📂 Project Structure

student_portal_api/
├── main.py         # FastAPI app entry
├── db.py           # DB connection setup
├── models.py       # Pydantic models
├── crud.py         # CRUD database logic
└── README.md       # Project documentation

🧪 API Endpoints
Students

    POST /students – Create a student

    GET /students – Get all students

    (add PUT, DELETE in crud.py as needed)



