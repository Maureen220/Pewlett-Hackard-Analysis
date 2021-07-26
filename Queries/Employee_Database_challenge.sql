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


	