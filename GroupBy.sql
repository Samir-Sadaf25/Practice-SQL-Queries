SELECT * FROM students;

SELECT country,avg(age) FROM students
GROUP BY country
HAVING avg(age) >= 23;

 SELECT extract(year FROM dob) as birth_year, count(*)
 from students
 GROUP BY dob;


 --1. Find the total number of students in each course.
 SELECT count(*) FROM students
 GROUP BY course;
--2. Calculate the average age of students grouped by their country.
SELECT avg(age) FROM students
GROUP BY country;
-- 3. Count how many students have the same blood_group.
SELECT count(*) FROM students
GROUP BY blood_group;

-- 4. List courses that have an average student age greater than 22.
SELECT course FROM students
GROUP BY course
HAVING avg(age) > 22;
--5. Show countries that have more than 5 students registered.
SELECT country FROM students
GROUP BY country
HAVING count(country) > 5
--6. Find the maximum age in each course, but only for courses starting with 'C'.

SELECT max(age),course FROM students
WHERE course LIKE 'C%'
GROUP BY course;

--7. Group students by grade and find the count, excluding any student whose grade is 'F'.
SELECT grade ,count(*) FROM students
WHERE grade != 'F'
GROUP BY grade;
--HAVING grade != 'F';

--8. List courses and their student counts, but only include courses where the youngest student is at least 18 years old.
SELECT count(*),course from students
GROUP BY course
HAVING min(age) >= 18;
--9. Find countries where the total number of students is between 2 and 10, and order the results by the count descending.
SELECT country, count(*) FROM students
GROUP BY country
HAVING count(*) BETWEEN 2 and 10
ORDER BY count(*) DESC;

--10. For each course, find the difference between the maximum and minimum age, showing only courses where this difference is greater than 5 years.
SELECT course, (MAX(age) - MIN(age)) AS age_difference
FROM students 
GROUP BY course
HAVING (MAX(age) - MIN(age)) > 5;