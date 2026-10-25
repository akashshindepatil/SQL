# SQL

-- Task 1: SELECT and WHERE
-- Find employees earning more than 30000.

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Rahul', 25000, 'IT'),
(2, 'Priya', 40000, 'HR'),
(3, 'Amit', 35000, 'IT'),
(4, 'Sneha', 45000, 'Finance');

SELECT employee_name, salary
FROM Employees
WHERE salary > 30000;
