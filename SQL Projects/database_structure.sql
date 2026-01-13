CREATE DATABASE company_db;
USE company_db;

CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    established_year INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO companies (company_name, location, established_year) 
VALUES 
('Tech Solutions Pvt Ltd', 'Bangalore', 2010),
('GreenField Agro Industries', 'Pune', 2015),
('BlueWave Logistics', 'Mumbai', 2012);

INSERT INTO departments (dept_name, company_id) 
VALUES 
('IT Development', 1),
('HR', 1),
('Sales', 1),
('Supply Chain', 2),
('Quality Control', 2),
('Marketing', 2),
('Operations', 3),
('Customer Support', 3),
('Accounts', 3);


INSERT INTO employees (first_name, last_name, email, salary, dept_id) 
VALUES 
('Rahul', 'Sharma', 'rahul.s@techsol.com', 65000.00, 1),
('Priya', 'Verma', 'priya.v@techsol.com', 45000.00, 2),
('Amit', 'Singh', 'amit.singh@techsol.com', 50000.00, 1),
('Sneha', 'Gupta', 'sneha.g@techsol.com', 40000.00, 3),
('Vikram', 'Malhotra', 'vikram.m@greenfield.com', 55000.00, 4),
('Anjali', 'Deshmukh', 'anjali.d@greenfield.com', 48000.00, 5),
('Rohan', 'Mehta', 'rohan.mehta@greenfield.com', 42000.00, 6),
('Kavita', 'Iyer', 'kavita.iyer@greenfield.com', 43000.00, 6),
('Suresh', 'Reddy', 'suresh.r@bluewave.com', 60000.00, 7),
('Meera', 'Nair', 'meera.n@bluewave.com', 35000.00, 8),
('Arjun', 'Kapoor', 'arjun.k@bluewave.com', 52000.00, 9),
('Pooja', 'Hegde', 'pooja.h@bluewave.com', 36000.00, 8);

SELECT * FROM employees;
select * from departments;
select * from companies;