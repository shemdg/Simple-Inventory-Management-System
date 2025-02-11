-- Create a database schema with the following structure, and retrieve all required data.
/*
CREATE SCHEMA sqlfundamentals1;

USE sqlfundamentals1;

CREATE TABLE departments (
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(45) NOT NULL,
    PRIMARY KEY (DepartmentID),
    UNIQUE KEY DepartmentName_UNIQUE (DepartmentName)
);
INSERT INTO departments (DepartmentName)
VALUES ('IT'),
	   ('HR'),
       ('Finance');

CREATE TABLE employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO employees (FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES ('John', 'Doe', 1, 50000, '2020-03-15'),
       ('Jane', 'Smith', 2, 60000, '2019-07-01'),
       ('Alice', 'Brown', 1, 55000, '2021-06-23'),
       ('Bob', 'Johnson', 3, 62000, '2018-09-12'),
       ('Charlie', 'Wilson', 2, 58000, '2022-01-08');
*/

-- 1. Retrieve all employees' first names and last names.
-- i used basic select statement
SELECT FirstName, LastName FROM Employees;

-- 2. Retrieve all employees ordered by their salary in descending order.
-- i used sorting data
SELECT * FROM Employees ORDER BY Salary DESC;

-- 3. Count the number of employees in each department.
-- i used table join and grouping data
-- changed variables into descriptive
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeesPerDept
FROM employees emp
INNER JOIN departments dept ON emp.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName;

-- 4. Find all employees whose first names starts with 'J'.
-- i used wildcard operation
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

-- 5. Display employees' first names, last names, and a new column "SalaryCategory" which shows 'High' if the salary is above 55000, otherwise 'Low'
-- i used if-then statement
SELECT FirstName, LastName,
    CASE
        WHEN Salary > 55000 THEN 'High'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

-- 6. Convert the hire date into a formatted string in the format 'Month, Day, Year' (e.g. 'March 15, 2020').
-- i used datetime functions
SELECT HireDate, DATE_FORMAT(HireDate, '%M-%d-%Y') AS FormattedHireDate FROM Employees;

-- 7. Retrieve all employees along with their department names.
-- i used table join
-- used descriptive variable names
SELECT emp.EmployeeID, emp.FirstName, emp.Lastname, emp.DepartmentID, dept.DepartmentName
FROM Employees emp
JOIN Departments dept ON emp.DepartmentID = dept.DepartmentID;

-- 8. Retrieve the employees who earn more than the average salary.
-- i used subquery and avg function
SELECT *
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 9. Get all employee names from the employees table and all department names from the departments table in a single list.
-- i used set operations 
SELECT FirstName AS 'Name', 'Employee' AS 'Type' FROM Employees

UNION ALL

SELECT DepartmentName AS 'Name', 'Department' AS 'Type' FROM Departments;

-- 10. Retrieve employees who were hired in the year 2020.
-- i used 
SELECT * FROM Employees WHERE HireDate > '2019-12-31' AND HireDate < '2021-01-01';

-- 11. Display each employees full name in uppercase.
-- i used string functions
SELECT LastName, FirstName, CONCAT(UPPER(FirstName), ' ', UPPER(LastName)) AS FullNameInUpperCase FROM Employees;

-- 12. Increase the salary of employees in the IT department by 10%, but ensure that the transaction is rolled back if something goes wrong.
-- i used transactions
-- i set autocommit to 0 because 0 disables autocommit where as 1 enables autocommit
Set autocommit = 0;

-- to disable safe updates if ur settings enables safe updates where as 1 enables it
SET SQL_SAFE_UPDATES = 0;

START TRANSACTION;

UPDATE employees
-- increase it employees salary by 10% (1.10 = 10%)
SET Salary = Salary * 1.10
WHERE DepartmentID = (SELECT DepartmentID FROM departments WHERE DepartmentName = 'IT');

-- commit if u want changes
COMMIT;

-- rollback if u dont want the changes
ROLLBACK;

-- view ur data
SELECT * FROM Employees;