 -- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- 2. Create independent tables
CREATE TABLE instructors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE
);

-- 3. Create the courses table (references instructors)
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    start_date DATE,
    category VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE SET NULL
);

-- 4. Create related tables (enrollments, grades, projects)
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    last_attendance_date DATE,
    status VARCHAR(50),
    semester VARCHAR(20),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE projects (
    student_id INT,
    project_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- =============================================
-- INSERT SAMPLE DATA
-- =============================================

INSERT INTO instructors (name) VALUES 
('Alexey Smirnov'),
('Elena Ivanova');

INSERT INTO students (first_name, last_name, birth_date) VALUES 
('Ivan', 'Petrov', '2002-05-15'),
('Maria', 'Sidorova', '2003-08-22'),
('Dmitry', 'Kuznetsov', '2001-11-10');

INSERT INTO courses (course_name, start_date, category, instructor_id) VALUES 
('Databases and SQL', '2026-09-01', 'IT', 1),
('Algorithms and Data Structures', '2026-09-01', 'IT', 2),
('Advanced Mathematics', '2026-09-01', 'Exact Sciences', 1);

INSERT INTO enrollments (student_id, course_id, last_attendance_date, status, semester) VALUES 
(1, 1, '2026-10-15', 'Active', 'Fall 2026'),
(1, 2, '2026-10-14', 'Active', 'Fall 2026'),
(2, 1, '2026-10-15', 'Active', 'Fall 2026'),
(3, 3, '2026-10-10', 'Completed', 'Spring 2026');

INSERT INTO grades (student_id, course_id, grade) VALUES 
(1, 1, 'A'),
(2, 1, 'B'),
(3, 3, 'A');

INSERT INTO projects (student_id, project_name) VALUES 
(1, 'Database Management System Development for an Online Store'),
(2, 'Analysis of Sorting Algorithms');
