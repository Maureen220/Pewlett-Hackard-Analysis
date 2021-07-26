-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

-- Create a new table using the INTO clause. Join both tables on the primary key.
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ti.title, 
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- Then, order by the employee number.
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY e.emp_no ASC;

-- Check table
SELECT * FROM retirement_titles;

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name, 
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- Check table 
SELECT * FROM unique_titles; 

-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Check table 
SELECT * FROM retiring_titles; 

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date
FROM employees as e;

-- Retrieve the from_date and to_date columns from the Department Employee table.
SELECT de.from_date, 
	de.to_date
FROM dept_emp as de;

-- Retrieve the title column from the Titles table.
SELECT ti.title
FROM titles as ti; 

-- Creating mentorship eligibility file by joining the three above tables
-- ans sorting by birthdate and current employment status. 
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
	INNER JOIN titles as ti
	ON e.emp_no = ti.emp_no	
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- Order the table by the employee number. (ascending)
ORDER BY e.emp_no ASC;

	
