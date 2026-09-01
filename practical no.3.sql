-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS college_demo;
USE college_demo;

-- 2. Drop tables 
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS department;

-- 3. Create Tables
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE INDEX idx_student_dept ON student(dept_id);

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

-- 4. Insert 
INSERT INTO department VALUES (1, 'Computer Science'), (2, 'Electronics');

INSERT INTO student VALUES (101, 'Nilisha', 'nilisha@mail.com', 1);
INSERT INTO student VALUES (102, 'Rahul', 'rahul@mail.com', 2);

INSERT INTO course VALUES (501, 'DBMS', 1), (502, 'Circuits', 2);

INSERT INTO enrollment VALUES (101, 501, 3, 'A');
INSERT INTO enrollment VALUES (101, 502, 3, 'B');

SELECT * FROM department;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM enrollment;
