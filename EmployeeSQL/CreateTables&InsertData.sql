DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(6),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

-- Load data into employees table using COPY
COPY employees FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/employees.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM employees;

DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);

-- Load data into employees table using COPY
COPY departments FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/departments.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM departments;

DROP TABLE IF EXISTS salaries;

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY salaries FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/salaries.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM salaries;

DROP TABLE IF EXISTS titles;

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY,
    title VARCHAR(255)
);

-- Load data into titles table using COPY
COPY titles FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/titles.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM titles;

DROP TABLE IF EXISTS dept_emp;

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Load data into titles table using COPY
COPY dept_emp FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/dept_emp.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM dept_emp;

DROP TABLE IF EXISTS dept_manager;

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Load data into titles table using COPY
COPY dept_manager FROM '/Users/aultsshit/SQL/Module9/EmployeeSQL/data/dept_manager.csv' 
WITH CSV HEADER DELIMITER ',' QUOTE '"';

SELECT * 
FROM dept_manager;
