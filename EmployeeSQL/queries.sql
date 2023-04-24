-- No 1
--List the employee number, last name, first name, sex, and salary of each employee.
select 
a.emp_no, a.last_name, a.first_name, a.sex, b.salary 
from employees as a
JOIN salaries as b on a.emp_no = b.emp_no;

--No 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
select 
last_name, first_name, hire_date 
from employees
where extract(year from hire_date) = 1986;

--No 3
--List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
select
a.dept_no, b.dept_name, c.emp_no, c.last_name, c.first_name 
from dept_manager as a
join departments as b on b.dept_no = a.dept_no
JOIN employees as c on c.emp_no = a.emp_no;

--No 4
-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
select 
a.dept_no, c.emp_no, c.last_name, c.first_name, b.dept_name
from employees as c
join dept_emp as a on a.emp_no = c.emp_no
join departments as b on b.dept_no = a.dept_no;

--No 5
-- List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.
select 
first_name, last_name, sex
from employees
where first_name like 'Hercules' and last_name like 'B%';

--No 6
-- List each employee in the Sales department, including their 
--employee number, last name, and first name.
select 
a.emp_no, a.last_name, a.first_name, c.dept_name
from employees as a
join dept_emp as b on b.emp_no = a.emp_no
join departments as c on c.dept_no = b.dept_no
where c.dept_name LIKE 'Sales';

-- No 7
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select 
a.emp_no, a.last_name, a.first_name, c.dept_name
from employees as a
inner join dept_emp as b on b.emp_no = a.emp_no
inner join departments as c on c.dept_no = b.dept_no
where c.dept_name LIKE 'Sales' or c.dept_name LIKE 'Development';

-- No 8
-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name).
select 
last_name, 
count(*) AS frequency
from employees
group by last_name
ORDER  BY frequency DESC;