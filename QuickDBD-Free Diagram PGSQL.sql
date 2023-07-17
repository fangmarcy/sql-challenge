﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZpCd6f
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
	 CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary money   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR(60)   NOT NULL
);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_Employees FOREIGN KEY (emp_no)
REFERENCES Employees(emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_Departments FOREIGN KEY (dept_no)
REFERENCES Departments(dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_Employees FOREIGN KEY (emp_no)
REFERENCES Employees(emp_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_Departments FOREIGN KEY (dept_no)
REFERENCES Departments(dept_no);
