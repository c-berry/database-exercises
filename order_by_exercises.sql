USE employees;


SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# 2.
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;


# 3.
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name,
last_name;


SELECT * FROM employees WHERE last_name LIKE 'E%';
# 4.
SELECT * FROM employees WHERE last_name LIKE 'E%'
ORDER BY emp_no;


# 5.
SELECT * FROM employees WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


# SELECT * FROM employees WHERE last_name LIKE '%Q%';
#
# # part two =>
# SELECT * FROM employees WHERE first_name = 'Irena'
#                            OR first_name = 'Vidya' OR first_name = 'Maya';
#
# SELECT * FROM employees WHERE (first_name = 'Irena'
#     OR first_name = 'Vidya' OR first_name = 'Maya')
#                           AND gender = 'M';
#
# SELECT * FROM employees WHERE last_name LIKE 'E%'
#                            OR last_name LIKE '%E';
#
# SELECT * FROM employees WHERE last_name LIKE 'E%'
#                           AND last_name LIKE '%E';

# SELECT * FROM employees WHERE last_name LIKE '%Q%'
#                           AND last_name NOT LIKE '%QU%';