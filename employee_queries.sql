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

SELECT * FROM Departments;

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

SELECT first_name, last_name, hire_date FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name FROM Department_Manager dm
JOIN Departments d ON dm.dept_no = d.dept_no
JOIN Employees e ON dm.emp_no = e.emp_no;

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name FROM Department_Employees de
JOIN Employees e ON de.emp_no = e.emp_no
JOIN Departments d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM Employees e
JOIN Department_Employees de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM Employees e
JOIN Department_Employees de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS name_count FROM Employees
GROUP BY last_name ORDER BY name_count DESC;