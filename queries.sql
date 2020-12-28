--Select details by employee
SELECT a.emp_no, a.last_name, 
a.first_name, a.gender, b.salary
FROM employees AS a
	LEFT JOIN salaries AS b
	ON (a.emp_no = b.emp_no)
	ORDER BY a.emp_no;

--Employees hired in 1986
SELECT * FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department 
SELECT a.dept_no, 
b.dept_name,
a.emp_no,
c.last_name,
c.first_name,
a.from_date,
a.to_date
FROM dept_management AS a
	INNER JOIN departments AS b
	ON (a.dept_no = b.dept_no)
	INNER JOIN employees AS c
	ON (a.emp_no = c.emp_no);

SELECT * FROM dept_management;

--List the department of each employee: 
--employee number, last name, first name, and department name.

SELECT a.emp_no, a.last_name, 
a.first_name, b.dept_name
FROM employees AS a
	INNER JOIN dept_emp AS c
		ON (a.emp_no = c.emp_no)
	INNER JOIN departments AS b
		ON (b.dept_no = c.dept_no)
ORDER BY a.emp_no;

--List all employees whose first name 
--is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List all employees in the Sales, 
--including their employee number, last name, first name, and department name.
SELECT a.emp_no, 
a.last_name, 
a.first_name, 
b.dept_name
FROM employees AS a
	INNER JOIN dept_emp AS c
		ON (a.emp_no = c.emp_no)
	INNER JOIN departments AS b
		ON (b.dept_no = c.dept_no)
WHERE b.dept_name = 'Sales'
ORDER BY a.emp_no;

--List all employees in the Sales & Development, 
--including their employee number, last name, first name, and department name.
SELECT a.emp_no, 
a.last_name, 
a.first_name, 
b.dept_name
FROM employees AS a
	INNER JOIN dept_emp AS c
		ON (a.emp_no = c.emp_no)
	INNER JOIN departments AS b
		ON (b.dept_no = c.dept_no)
WHERE b.dept_name IN ('Sales','Development')
ORDER BY a.emp_no;

--frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
