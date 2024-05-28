
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT	e.emp_no,		
		e.last_name,
		e.first_name,
		CASE 
			WHEN e.sex='M' THEN 'Male'
			WHEN e.sex='F' THEN 'Female'
		END as gender,
		s.salary
FROM employee e INNER JOIN empployee_salary s ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT	first_name,
		last_name, 
		hire_date
FROM employee
WHERE DATE_PART('year',hire_date)=1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT	dm.dept_no,
		dp.dept_name,
		dm.emp_no,
		em.last_name,
		em.first_name	
FROM department_manager dm LEFT JOIN department dp ON dm.dept_no=dp.dept_no
LEFT JOIN employee em ON dm.emp_no=em.emp_no
ORDER BY dm.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT	de.emp_no,
		em.last_name,
		em.first_name,
		de.dept_no,
		dp.dept_name		
FROM department_employee de LEFT JOIN employee em ON de.emp_no=em.emp_no
LEFT JOIN department dp ON de.dept_no=dp.dept_no
ORDER BY em.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT	first_name,
		last_name,
		CASE 
			WHEN sex='M' THEN 'Male'
			WHEN sex='F' THEN 'Female'
		END as gende
FROM	employee
WHERE	first_name='Hercules'
AND		last_name  LIKE 'B%'
ORDER BY	last_name;	

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT	de.emp_no,
		last_name,
		first_name		
FROM	department_employee de LEFT JOIN employee em ON de.emp_no=em.emp_no
WHERE	de.dept_no IN (
					SELECT	dept_no
					FROM	department
					WHERE	dept_name='Sales'
					)
ORDER BY de.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT	de.emp_no,
		last_name,
		first_name,
		dp.dept_name
FROM	department_employee de LEFT JOIN employee em ON de.emp_no=em.emp_no
LEFT JOIN department dp on de.dept_no=dp.dept_no
WHERE	  dp.dept_name IN('Sales','Development')
ORDER BY  dp.dept_name,de.emp_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(*) AS frequency_count
FROM employee
GROUP BY last_name
ORDER BY frequency_count DESC;
