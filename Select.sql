CREATE table students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
age int, 
course varchar(15),
grade CHAR(2),
blood_group CHAR(5),
email VARCHAR(60),
dob DATE,
country VARCHAR(15)
)

-- Insert 10 dummy students
INSERT INTO students (first_name, last_name, age, course, grade, blood_group, email, dob, country) VALUES
('Alice', 'Johnson', 20, 'CS', 'A', 'O+', 'alice.johnson@example.com', '2006-05-14', 'USA'),
('Rahul', 'Singh', 22, 'Math', 'B+', 'A+', 'rahul.singh@example.com', '2004-03-09', 'India'),
('Maria', 'Gonzalez', 19, 'Physics', 'A-', 'B+', 'maria.g@example.com', '2007-11-21', 'Spain'),
('David', 'Brown', 23, 'Chemistry', 'C', 'O-', 'david.brown@example.com', '2003-07-02', 'UK'),
('Sakura', 'Tanaka', 21, 'Biology', 'B', 'AB+', 'sakura.t@example.com', '2005-01-30', 'Japan'),
('Omar', 'Hassan', 24, 'CS', 'A', 'A-', 'omar.hassan@example.com', '2002-09-15', 'Egypt'),
('Elena', 'Petrova', 20, 'Math', 'B-', 'B-', 'elena.p@example.com', '2006-04-18', 'Russia'),
('Michael', 'Smith', 22, 'Economics', 'A+', 'O+', 'michael.smith@example.com', '2004-12-05', 'Canada'),
('Fatima', 'Ali', 19, 'CS', 'A', 'AB-', 'fatima.ali@example.com', '2007-08-27', 'Bangladesh'),
('Jonas', 'Müller', 21, 'History', 'C+', 'A+', 'jonas.m@example.com', '2005-02-11', 'Germany');

INSERT INTO students (first_name, last_name, age, course, grade, blood_group, email, dob, country) VALUES ('Borshon', 'roy', 26, 'EEE', 'A', 'O+', 'Borshon.roy@example.com', '2003-07-16', 'Bangladesh');

SELECT first_name,last_name,email FROM students;
SELECT * FROM students where age > 21;
SELECT * from students WHERE country IN('USA','Canada');

SELECT * from students WHERE grade NOT IN('A', 'A+');


SELECT * FROM students WHERE email LIKE '%@example.com';
SELECT * FROM students where dob BETWEEN '2000-1-1' and '2005-12-31';
SELECT * from students where course = 'CS' and blood_group = 'O+';
select first_name,age from students ORDER BY age DESC;
SELECT * from students where extract(MONTH FROM dob) = 08;

SELECT count(course) from students where course = 'CS';

SELECT course,avg(age)
from students 
GROUP BY course
HAVING avg(age) > 20;

SELECT upper(first_name) FROM students;
SELECT length(first_name) FROM students;
SELECT concat(first_name,last_name) FROM students;
SELECT date_part('year',dob) FROM students;

SELECT avg(age) FROM students;
SELECT min(age) FROM students;
SELECT count(country) FROM students
WHERE country = 'USA';
SELECT max(dob) FROM students;

SELECT * FROM students;
SELECT * FROM students WHERE email is NULL;

SELECT course, avg(age) FROM students GROUP BY course;

SELECT  country,count(*) FROM students GROUP BY country;
SELECT course,count(*) from students GROUP BY course having count(course) >2;

SELECT grade,avg(age) FROM students GROUP BY grade HAVING avg(age) >= 20;

SELECT COALESCE(email,'email not provided') FROM students;

SELECT * FROM students WHERE course IN ('Math','Physics','History');
SELECT * FROM students WHERE course = 'Math'  or course = 'History';

SELECT * from students where age BETWEEN 20 and 23;

SELECT * from students where first_name ILIKE 's%';

-- pagination limit offset
select * from students LIMIT 5 OFFSET 5 * 0; -- if i want to show 5 data of each page
SELECT * from students LIMIT 5 OFFSET 5 * 1; -- second page 6 to 10 
SELECT * from students LIMIT 5 OFFSET 5 * 2; -- third page 11 to 15 

DELETE from students WHERE grade = 'C' and country = 'USA';
UPDATE  students
set email = 'default@example.com', country = 'Iran', course = 'IT'
WHERE first_name = 'Elena';