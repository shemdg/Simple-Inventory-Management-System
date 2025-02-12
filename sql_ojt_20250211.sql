USE SQL_OJT_20250211;
SELECT * FROM employees;
DESCRIBE employees;

-- Note : Insert at least (10) data per table

-- Challenge:
-- You have a table employees with the following structure:

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10.2),
    hire_date DATE
);

-- Insert at least 10 data (i used the 4 data from previous the sql and then added 6 more data)
INSERT INTO employees (`name`, department, salary, hire_date)
VALUES ('John Doe', 'IT', 50000, '2020-03-15'),
       ('Jane Smith', 'HR', 60000, '2019-07-01'),
       ('Alice Brown', 'IT', 55000, '2021-06-23'),
       ('Bob Johnson', 'Finance', 62000, '2018-09-12'),
       ('Charlie Wilson', 'HR', 58000, '2022-01-08'),
       ('David Lee', 'Sales', 53000, '2021-10-15'),
       ('Eva Green', 'Marketing', 61000, '2019-05-03'),
       ('Frank Martin', 'Finance', 67000, '2017-11-21'),
       ('Grace Hall', 'Sales', 49000, '2022-03-14'),
       ('Hank Thomas', 'IT', 56000, '2020-08-25');

-- Write a query that:

-- 1. Creates a temporary table temp_high_salaries to store employees who earn more than 50,000.
CREATE TEMPORARY TABLE  temp_high_salaries (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10.2),
    hire_date DATE
);

-- 2. Inserts employees (into temp_high_salaries table) from the employees table who meet this condition.
INSERT INTO temp_high_salaries
SELECT id, `name`, department, salary, hire_date
    FROM employees
    WHERE salary > 50000;

-- 3. Retrieves data from the temporary table.
SELECT * FROM temp_high_salaries;

-- 4. Create a view called recent_hires that displays employees who were hired in the last 6 months.
CREATE VIEW recent_hires AS
SELECT *
FROM employees
WHERE (hire_date > '2024-09-01');

-- no data was inserted because the hire_date from my data are 2021 and less
SELECT * FROM recent_hires;

-- 5. Create a stored procedure GetEmployeesByDepartment that takes a department name as input and returns all employees in that department.
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN department_name VARCHAR(50))
BEGIN
    SELECT *
    FROM employees
    WHERE department = department_name;
END $$

DELIMITER ;

-- retrieve data
CALL GetEmployeesByDepartment('IT');

-- Challenge
-- You have a table customers with the following structure:

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

DROP TABLE customers;

INSERT INTO customers (name, email, city, signup_date)
VALUES 
('John Doe', 'john.doe@example.com', 'New York', '2023-01-15'),
('Jane Smith', 'jane.smith@example.com', 'New York', '2023-02-10'),
('Alice Brown', 'alice.brown@example.com', 'Los Angeles', '2023-03-05'),
('Bob Johnson', 'bob.johnson@example.com', 'Los Angeles', '2023-04-20'),
('Charlie Wilson', 'charlie.wilson@example.com', 'Chicago', '2023-05-15'),
('David Lee', 'david.lee@example.com', 'Chicago', '2023-06-25'),
('Eva Green', 'eva.green@example.com', 'Houston', '2023-07-12'),
('Frank Martin', 'frank.martin@example.com', 'Houston', '2023-08-03'),
('Grace Hall', 'grace.hall@example.com', 'Dallas', '2023-09-14'),
('Hank Thomas', 'hank.thomas@example.com', 'Dallas', '2023-10-08'),
('Ivy Kim', 'ivy.kim@example.com', 'New York', '2023-11-22'),
('Jake White', 'jake.white@example.com', 'New York', '2023-12-11'),
('Kelly Brown', 'kelly.brown@example.com', 'Los Angeles', '2024-01-15'),
('Liam Turner', 'liam.turner@example.com', 'Los Angeles', '2024-02-05'),
('Mia Collins', 'mia.collins@example.com', 'Chicago', '2024-03-19'),
('Noah Reed', 'noah.reed@example.com', 'Chicago', '2024-04-25'),
('Olivia King', 'olivia.king@example.com', 'Houston', '2024-05-07'),
('Paul Scott', 'paul.scott@example.com', 'Houston', '2024-06-13'),
('Quincy Adams', 'quincy.adams@example.com', 'Dallas', '2024-07-20'),
('Rachel Green', 'rachel.green@example.com', 'Dallas', '2024-08-11'),
('Sam Harris', 'sam.harris@example.com', 'New York', '2024-09-16'),
('Tina Lee', 'tina.lee@example.com', 'New York', '2024-10-21'),
('Uma Patel', 'uma.patel@example.com', 'Los Angeles', '2024-11-27'),
('Victor Clark', 'victor.clark@example.com', 'Los Angeles', '2024-12-05'),
('Wendy Stone', 'wendy.stone@example.com', 'Chicago', '2025-01-02'),
('Xander Young', 'xander.young@example.com', 'Chicago', '2025-02-18'),
('Yara Gray', 'yara.gray@example.com', 'Houston', '2025-03-14'),
('Zach Taylor', 'zach.taylor@example.com', 'Houston', '2025-04-22');


SELECT * FROM customers;
SELECT * FROM customers WHERE city = 'New York';

-- 1. Identify which column(s) should be indexed for better search performance.
-- 2. Create an appropriate index. (idx_city, idx_name, idx_signup_date)

CREATE INDEX idx_city
ON customers (city);

EXPLAIN SELECT * FROM customers WHERE city = 'New York';

CREATE INDEX idx_name
ON customers (`name`);

CREATE INDEX idx_signup_date
ON customers (signup_date);