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
