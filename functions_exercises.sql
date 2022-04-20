USE employees;

#2.
SELECT CONCAT(first_name, ' ', last_name) AS 'First and Last name'
FROM employees WHERE last_name LIKE 'E%E'
ORDER BY emp_no DESC;

# 3.
SELECT * FROM employees WHERE MONTH(birth_date) = '12'
AND DAY(birth_date) = '25';


# 4.
SELECT * FROM employees WHERE (YEAR(hire_date) > 1989
AND YEAR(hire_date) < 2000)
AND MONTH(birth_date) = '12'
AND DAY(birth_date) = '25';
# OR
# SELECT * FROM employees WHERE birth_date LIKE '%-12-25';
# AND hire_date LIKE '199%';

# 5.
SELECT * FROM employees WHERE (YEAR(hire_date) > 1989
AND YEAR(hire_date) < 2000)
AND MONTH(birth_date) = '12'
AND DAY(birth_date) = '25'
ORDER BY birth_date
AND hire_date DESC
LIMIT 1;

# 1952-12-25,Khun,Bernini,M,1999-08-31


# 6.
SELECT CONCAT('Days at company: ', DATEDIFF(NOW(), hire_date))
AS 'Days at company',
CONCAT(first_name, ' ', last_name) AS 'Name'
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY  birth_date ASC, hire_date DESC;