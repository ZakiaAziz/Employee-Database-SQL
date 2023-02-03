--list the all the employees number, last name, first name, sex and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT employees.first_name, employees.last_name,employees.hire_date
FROM employees
WHERE date_part('year',hire_date)=1986;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name
SELECT employees.emp_no, employees.first_name,employees.last_name,departmentmanagers.dept_no,departments.dept_name
FROM departmentmanagers
INNER JOIN employees on
employees.emp_no=departmentmanagers.emp_no
INNER JOIN departments on
departments.dept_no=departmentmanagers.dept_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT departments.dept_no,employees.emp_no, employees.first_name,employees.last_name,departments.dept_name
FROM departmentemployees
INNER JOIN employees on
employees.emp_no=departmentemployees.emp_no
INNER JOIN departments on
departments.dept_no=departmentemployees.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT  employees.first_name,employees.last_name,employees.sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT  employees.emp_no,employees.first_name,employees.last_name
FROM departmentemployees
INNER JOIN employees on
employees.emp_no=departmentemployees.emp_no
INNER JOIN departments on
departments.dept_no=departmentemployees.dept_no
WHERE dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT  employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departmentemployees
INNER JOIN employees on
employees.emp_no=departmentemployees.emp_no
INNER JOIN departments on
departments.dept_no=departmentemployees.dept_no
WHERE dept_name='Sales' OR dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).
SELECT COUNT(last_name) AS Frequency,last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;