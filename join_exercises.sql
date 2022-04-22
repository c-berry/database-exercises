USE employees;

# 1.
SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > NOW()
ORDER BY departments.dept_name;

# or =>
# SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
# FROM departments
# JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
# JOIN employees ON employees.emp_no = dept_manager.emp_no
# WHERE dept_manager.to_date > NOW()
# ORDER BY departments.dept_name;

# or =>
# SELECT d.dept_name AS `Department Name`, CONCAT(e.first_name, ' ' , e.last_name) AS 'Department Manager'
# FROM employees e
# JOIN dept_manager dm ON e.emp_no = dm.emp_no
# JOIN departments d ON d.dept_no = dm.dept_no
# WHERE YEAR(dm.to_date) = 9999;

# using aliases =>
# SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
# FROM employees AS e
# JOIN dept_manager AS m
# ON m.emp_no = e.emp_no
# JOIN departments AS d
# ON d.dept_no = m.dept_no
# WHERE m.to_date > NOW()
# ORDER BY d.dept_name;

# 2.
SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > NOW()
AND employees.gender = 'F'
ORDER BY departments.dept_name;

# 3.
SELECT title, COUNT(title) AS Total
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
WHERE dept_no = 'D009'
AND titles.to_date LIKE '9%'
AND dept_emp.to_date LIKE  '9%'
GROUP BY title;

# SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
# FROM employees
# JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
# JOIN departments ON departments.dept_no = dept_manager.dept_no
# WHERE dept_manager.to_date > NOW()
# AND departments.dept_name = 'Customer Service'
# ORDER BY departments.dept_name;

# 4.
SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > NOW()
AND salaries.to_date > NOW()
ORDER BY departments.dept_name;

# SELECT departments.dept_name AS Dept_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_Name
# FROM employees
# JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
# JOIN departments ON departments.dept_no = dept_manager.dept_no
# WHERE dept_manager.to_date > NOW()
# ORDER BY departments.dept_name;

# BONUS
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employees,
       d.dept_name AS Department,
       CONCAT(e2.first_name, ' ', e2.last_name) AS Manager
FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON d.dept_no = de.dept_no
    JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN employees e2 ON dm.emp_no = e2.emp_no
WHERE  de.to_date LIKE '9%'
AND dm.to_date LIKE '9%';

SELECT CONCAT(e.first_name, ' ' , e.last_name) AS Employee, d.dept_name AS Department, CONCAT(ee.first_name, ' ' , ee.last_name) AS Manager
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON d.dept_no = de.dept_no
         JOIN dept_manager dm on d.dept_no = dm.dept_no
         JOIN employees ee on dm.emp_no = ee.emp_no
WHERE YEAR(de.to_date) = 9999 AND YEAR(dm.to_date) = 9999;