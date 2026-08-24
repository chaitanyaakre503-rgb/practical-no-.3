College Demo Database

Description

This SQL file creates a college database management system containing departments, students, courses, and student enrollments. It demonstrates primary keys, foreign keys, unique constraints, CHECK constraints, data insertion, and INNER JOIN.

1. Create Database

CREATE DATABASE IF NOT EXISTS college_demo;
USE college_demo;

Creates the "college_demo" database if it does not already exist and selects it for use.

2. Remove Existing Tables

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS department;
SET FOREIGN_KEY_CHECKS = 1;

Temporarily disables foreign-key checking so the existing tables can be safely deleted and recreated.

🏢 3. Department Table

The "department" table stores department information.

Column| Description
"dept_id"| Unique department ID
"dept_name"| Department name

"PRIMARY KEY" makes "dept_id" unique, while "UNIQUE NOT NULL" prevents duplicate or empty department names.

4. Student Table

The "student" table stores student information.

Column| Description
"roll_no"| Unique student roll number
"name"| Student name
"email"| Student email
"aadhar_no"| Student identification number
"dept_id"| Department ID

The "dept_id" is a foreign key connected to the "department" table.

5. Course Table

The "course" table stores course information.

Column| Description
"course_id"| Unique course ID
"course_name"| Course name
"dept_id"| Department offering the course

The "dept_id" is a foreign key referencing the "department" table.

6. Enrollment Table

The "enrollment" table records which student is enrolled in which course.

Column| Description
"roll_no"| Student roll number
"course_id"| Course ID
"semester"| Semester number from 1 to 8
"grade"| Student's grade

The combination of "roll_no", "course_id", and "semester" forms a composite primary key.

The "CHECK" constraint ensures that the semester is between 1 and 8.

7. Insert Data

The file inserts:

- 2 departments: Computer Science and Electronics
- 2 students: Hansika and Ashwin
- 2 courses: DBMS and Circuits
- 2 enrollment records: including semester and grades

🔗 8. INNER JOIN Query

The final query combines information from all four tables:

FROM enrollment e
INNER JOIN student s ON e.roll_no = s.roll_no
INNER JOIN course c ON e.course_id = c.course_id
INNER JOIN department d ON s.dept_id = d.dept_id;

"INNER JOIN" connects the related records using their primary and foreign keys and displays complete student enrollment information.

Expected Output

Roll No| Student Name| Department| Course| Semester| Grade
101| Hansika| Computer Science| DBMS| 3| A
102| Ashwin| Electronics| Circuits| 3| B

Concepts Demonstrated

- Database creation
- Table creation
- Primary key
- Composite primary key
- Foreign key
- "UNIQUE" constraint
- "NOT NULL" constraint
- "CHECK" constraint
- Data insertion
- "INNER JOIN"
- Table relationships
- Retrieving combined data from multiple tables

How to Run

1. Open MySQL Workbench or a MySQL terminal.
2. Copy the complete SQL code.
3. Execute the code from top to bottom.
4. Run the final "SELECT" query to view the enrollment details.
