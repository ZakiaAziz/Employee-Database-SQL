CREATE TABLE Titles (
    title_id VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (title_id)
);


CREATE TABLE Employees(
    emp_no INTEGER  NOT NULL,
    title_id VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    first_Name VARCHAR(50) NOT NULL,
    last_Name VARCHAR(50) NOT NULL,
    sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Departments (
    dept_no VARCHAR(50) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);


CREATE TABLE DepartmentEmployees(
    emp_no INT NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE DepartmentManagers (
    dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);


CREATE TABLE Salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM DepartmentEmployees;
SELECT * FROM DepartmentManagers;
SELECT * FROM Departments;
SELECT * FROM Salaries;
SELECT * FROM Employees;
SELECT * FROM Titles;