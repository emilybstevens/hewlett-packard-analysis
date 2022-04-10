-- DELIVERABLE 1 ************************************************

-- RETIREMENT INFO
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti. from_date, ti.to_date
INTO retirement_titles
FROM titles as ti
INNER JOIN employees as e
on (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;



-- UNIQUE TITLES

SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;



-- COUNT OF EMP ABOUT TO RETIRE

SELECT COUNT(ti.emp_no),ti.title
INTO retiring_titles
FROM unique_titles as ti
GROUP BY title
ORDER BY COUNT(title) DESC;





-- DELIVERABLE 2 ************************************************

SELECT DISTINCT ON(e.emp_no)e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	on(e.emp_no = de.emp_no)
INNER JOIN titles as ti
	on(e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;























