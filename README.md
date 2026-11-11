
# University Database — MySQL

A relational database project for managing university students, instructors, courses, enrollments, grades, and student projects.

## Technologies

- MySQL
- MySQL Workbench
- SQL
- Git & GitHub

## Database Structure

The `university_db` database contains six tables:

| Table | Description |
|-------|-------------|
| `students` | Stores student information |
| `instructors` | Stores instructor information |
| `courses` | Stores courses and assigned instructors |
| `enrollments` | Tracks student enrollments and attendance |
| `grades` | Stores student grades |
| `projects` | Stores student projects |

## Relationships

- One instructor can teach multiple courses.
- One student can enroll in multiple courses.
- One course can have multiple students.
- Grades are associated with students and courses.
- Students can have multiple projects.

## Features

- Primary and foreign keys
- Auto-incrementing IDs
- One-to-many and many-to-many relationships
- Referential integrity
- Cascading deletes
- Sample data

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Clone this repository:

   git clone https://github.com/labkramar-jpg/mysql-university-database.git

3. Open `university_db.sql` in MySQL Workbench.
4. Execute the SQL script.

The script creates the database, tables, and inserts sample records.

## Example Queries

Show all students:

    SELECT * FROM university_db.students;

Show all courses:

    SELECT * FROM university_db.courses;

## Learning Objectives

- Understand relational database design
- Create and manage tables using SQL
- Work with primary and foreign keys
- Insert and retrieve data
- Practice SQL queries

## Author

GitHub: [labkramar-jpg](https://github.com/labkramar-jpg)
