-- Active: 1676992608249@@127.0.0.1@3306@sql_questions

-- 1. Write a SQL query to find the second highest salary without using limits from the
-- table below. Also write a query to find the nth highest salary.
-- ==========================================================================================
-- CREATE DATABASE demo;
-- create table employee_salary
CREATE Table
    IF NOT EXISTS employee_salary(
        id INT PRIMARY KEY AUTO_INCREMENT,
        staff_name VARCHAR(255) NOT NULL,
        salary INT NOT NULL
    );

-- insert data into table
INSERT INTO
    employee_salary(staff_name, salary)
        VALUES ('Ankur Mainali', 50000), ('Madhu Sudan Dahal', 20000), ('Sagar GC', 55000), 
        ('Dakshya Prasad Shrestha',10000), ('Sagun Dhungana', 35000);

-- i'm not going to use nested query instead i'm going to use common table expression
WITH tbl_salary AS (
SELECT 
    *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS salary_rank 
from employee_salary
)

SELECT * from tbl_salary WHERE salary_rank = 2;


-- 3. Given below are two tables, department and staff. Write an SQL query showing the
-- total salary allocated for each department ordered by the department with the
-- highest total salary.
-- ==============================================================================

CREATE Table IF NOT EXISTS department(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(255) NOT NULL
);

INSERT INTO department(dept_name) VALUES('Accounts'),
                                    ('Frontend'),
                                    ('Backend'),
                                    ('Human Resource');

CREATE Table IF NOT EXISTS staff(
    staff_id INT primary KEY AUTO_INCREMENT,
    staff_name VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    dept_id INT,
    Foreign Key (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE
);

INSERT INTO staff(staff_name,salary,dept_id) VALUES('Aayushman Shrestha',20000,1),
                                                    ('Shyam Kumar',30000,1),
                                                    ('Birendra Bista',42000,3),
                                                    ('Jasmine KC',33000,4),
                                                    ('Manish Shakya',24000,2),
                                                    ('Ashish Kumar Shrestha',12000,2),
                                                    ('Nischal Maharjan',15500,3),
                                                    ('Bikram Ale',25000,3);
                                                                                             
SELECT 
    D.dept_name,
    SUM(S.salary) AS total_amount
FROM department D INNER JOIN staff S ON D.dept_id = S.dept_id GROUP BY D.dept_name ORDER BY total_amount DESC;