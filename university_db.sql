 -- 1. Создание и выбор базы данных
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- 2. Создание независимых таблиц
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

-- 3. Создание таблицы курсов (ссылается на преподавателей)
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    start_date DATE,
    category VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE SET NULL
);

-- 4. Создание таблиц связей (зачисление, оценки, проекты)
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
-- ЗАПОЛНЕНИЕ ТЕСТОВЫМИ ДАННЫМИ
-- =============================================

INSERT INTO instructors (name) VALUES 
('Алексей Смирнов'),
('Елена Иванова');

INSERT INTO students (first_name, last_name, birth_date) VALUES 
('Иван', 'Петров', '2002-05-15'),
('Мария', 'Сидорова', '2003-08-22'),
('Дмитрий', 'Кузнецов', '2001-11-10');

INSERT INTO courses (course_name, start_date, category, instructor_id) VALUES 
('Базы данных и SQL', '2026-09-01', 'IT', 1),
('Алгоритмы и структуры данных', '2026-09-01', 'IT', 2),
('Высшая математика', '2026-09-01', 'Точные науки', 1);

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
(1, 'Разработка СУБД для интернет-магазина'),
(2, 'Анализ алгоритмов сортировки');