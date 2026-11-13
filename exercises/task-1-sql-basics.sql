-- Task 1: SQL Basics (25 exercises)
USE university_db;

-- 1. Students whose first name starts with A and who were born after 1995
SELECT *
FROM students
WHERE first_name LIKE 'A%' AND YEAR(birth_date) > 1995;

-- 2. Students with score 4 or 5 and id greater than 10
SELECT *
FROM students
WHERE score IN (4, 5) AND id > 10;

-- 3. Students born in March or April
SELECT *
FROM students
WHERE MONTH(birth_date) IN (3, 4);

-- 4. Students whose last name starts with S or D
SELECT *
FROM students
WHERE last_name LIKE 'S%' OR last_name LIKE 'D%';

-- 5. Students whose id is between 20 and 100 and score greater than 3
SELECT *
FROM students
WHERE id BETWEEN 20 AND 100 AND score > 3;

-- 6. Students ordered by score descending
SELECT *
FROM students
ORDER BY score DESC;

-- 7. Students ordered by last name, then first name
SELECT *
FROM students
ORDER BY last_name, first_name;

-- 8. Students born in the first 10 days of a month
SELECT *
FROM students
WHERE DAY(birth_date) BETWEEN 1 AND 10;

-- 9. Students whose first name contains a and score is less than 4
SELECT *
FROM students
WHERE first_name LIKE '%a%' AND score < 4;

-- 10. Five students with the highest score
SELECT *
FROM students
WHERE score IS NOT NULL
ORDER BY score DESC, id ASC
LIMIT 5;

-- 11. Students whose id is not 1, 2, or 3
SELECT *
FROM students
WHERE id NOT IN (1, 2, 3);

-- 12. Students born in winter (December, January, February)
SELECT *
FROM students
WHERE MONTH(birth_date) IN (12, 1, 2);

-- 13. Students whose last name contains o
SELECT *
FROM students
WHERE last_name LIKE '%o%';

-- 14. Students with score greater than 2 and less than 5
SELECT *
FROM students
WHERE score > 2 AND score < 5;

-- 15. Students ordered by birth year
SELECT *
FROM students
ORDER BY YEAR(birth_date);

-- 16. Students whose first name starts with T and id is greater than 50
SELECT *
FROM students
WHERE first_name LIKE 'T%' AND id > 50;

-- 17. Students born in 1990, 1995, or 2000
SELECT *
FROM students
WHERE YEAR(birth_date) IN (1990, 1995, 2000);

-- 18. Students with score 3 or last name starting with B
SELECT *
FROM students
WHERE score = 3 OR last_name LIKE 'B%';

-- 19. Students with id greater than 10 who were born in summer
SELECT *
FROM students
WHERE id > 10 AND MONTH(birth_date) IN (6, 7, 8);

-- 20. Students ordered by score and id
SELECT *
FROM students
ORDER BY score, id;

-- 21. Students whose first name is longer than 5 characters
SELECT *
FROM students
WHERE CHAR_LENGTH(first_name) > 5;

-- 22. Students whose last name ends in n and score is 5
SELECT *
FROM students
WHERE last_name LIKE '%n' AND score = 5;

-- 23. Students born after 1998, ordered by birth date
SELECT *
FROM students
WHERE YEAR(birth_date) > 1998
ORDER BY birth_date;

-- 24. Students whose id is divisible by 3
SELECT *
FROM students
WHERE id % 3 = 0;

-- 25. Seven students with the lowest non-NULL scores
SELECT *
FROM students
WHERE score IS NOT NULL
ORDER BY score ASC, id ASC
LIMIT 7;
