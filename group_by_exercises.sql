USE employees;

# 2.
SELECT DISTINCT title FROM titles;

# 3.
SELECT last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name
ORDER BY last_name;

# 4.
SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;

# 5.
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE '%Q%'
AND last_name NOT LIKE '%QU%';

# 6.
SELECT COUNT(*), last_name FROM employees
WHERE last_name LIKE '%Q%'
AND last_name NOT LIKE '%QU%'
GROUP BY last_name;

# 7.
SELECT COUNT(*), gender FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
GROUP BY gender;