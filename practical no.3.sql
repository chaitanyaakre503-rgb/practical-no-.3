CREATE DATABASE IF NOT EXISTS college_demo;
USE college_demo;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS department;
SET FOREIGN_KEY_CHECKS = 1; 

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    aadhar_no VARCHAR(12) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- 3. Course Table
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE enrollment (
    roll_no INT,
    course_id INT,
    semester INT CHECK (semester BETWEEN 1 AND 8),
    grade CHAR(2),
    PRIMARY KEY (roll_no, course_id, semester),
    FOREIGN KEY (roll_no) REFERENCES student(roll_no),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electronics');

INSERT INTO student (roll_no, name, email, aadhar_no, dept_id) VALUES
(101, 'Hansika', 'hansika@mail.com', '123456789012', 1),
(102, 'Ashwin', 'ashwin@mail.com', '987654321098', 2);

INSERT INTO course (course_id, course_name, dept_id) VALUES
(501, 'DBMS', 1),
(502, 'Circuits', 2);

INSERT INTO enrollment (roll_no, course_id, semester, grade) VALUES
(101, 501, 3, 'A'),
(102, 502, 3, 'B');

SELECT 
    s.roll_no AS 'Roll No',
    s.name AS 'Student Name',
    d.dept_name AS 'Department',
    c.course_name AS 'Course',
    e.semester AS 'Semester',
    e.grade AS 'Grade'
FROM enrollment e
INNER JOIN student s ON e.roll_no = s.roll_no
INNER JOIN course c ON e.course_id = c.course_id
INNER JOIN department d ON s.dept_id = d.dept_id;