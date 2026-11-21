-- Task 2: SQL JOINs (10 exercises)
USE university_db;

-- 1. All courses and the instructors who teach them
SELECT courses.course_name, instructors.name
FROM courses
INNER JOIN instructors ON courses.instructor_id = instructors.id;

-- 2. Students and the names of the courses they are enrolled in
SELECT students.first_name, students.last_name, courses.course_name
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.id;

-- 3. Students and the names of their projects
SELECT students.first_name, students.last_name, projects.project_name
FROM students
INNER JOIN projects ON students.id = projects.student_id;

-- 4. Students and grades they received
SELECT students.first_name, students.last_name, grades.grade
FROM students
INNER JOIN grades ON students.id = grades.student_id;

-- 5. Course name, category, and instructor name
SELECT courses.course_name, courses.category, instructors.name
FROM courses
INNER JOIN instructors ON courses.instructor_id = instructors.id;

-- 6. Student names, course names, and their last attendance dates
SELECT students.first_name, courses.course_name, enrollments.last_attendance_date
FROM students
INNER JOIN enrollments ON enrollments.student_id = students.id
INNER JOIN courses ON enrollments.course_id = courses.id;

-- 7. Course names and grades, without student names
SELECT courses.course_name, grades.grade
FROM courses
INNER JOIN grades ON courses.id = grades.course_id;

-- 8. Student names and semesters they are enrolled in
SELECT students.first_name, enrollments.semester
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id;

-- 9. Course name, student name, and grade for that course
SELECT courses.course_name, students.first_name, grades.grade
FROM students
INNER JOIN grades ON students.id = grades.student_id
INNER JOIN courses ON courses.id = grades.course_id;

-- 10. Instructors and their courses in the Computer Science category
-- Note: The original seed data has 'IT' and 'Exact Sciences', not 'Computer Science'.
-- This exact exercise query may return no rows unless the category data is updated.
SELECT instructors.name, courses.course_name
FROM instructors
INNER JOIN courses ON instructors.id = courses.instructor_id
WHERE courses.category = 'Computer Science';
