DROP DATABASE IF EXISTS join_test_db;
CREATE DATABASE join_test_db;

USE join_test_db;

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);
DROP TABLE IF EXISTS users;
CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

#

USE codeup_test_db;

DROP TABLE IF EXISTS `persons`;
CREATE TABLE `persons` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(25) NOT NULL,
`album_id` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
KEY `album_id` (`album_id`),
CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
);

INSERT INTO `persons` VALUES (1,'Olivia',29),(2,'Santiago',27),(3,'Tareq',15),(4,'Anaya',28);

DESCRIBE persons;
SHOW INDEXES FROM persons;

SELECT * FROM information_schema.table_constraints WHERE  constraint_schema = 'codeup_test_db';

SELECT p.first_name, a.name FROM persons p JOIN albums a ON a.id = p.album_id;

SELECT p.first_name, a.name FROM  albums a LEFT JOIN persons p  ON a.id = p.album_id;

SELECT p.first_name, a.name FROM  albums a LEFT JOIN persons p  ON a.id = p.album_id;

SELECT p.first_name, a.name FROM  persons p LEFT JOIN albums a  ON a.id = p.album_id;

DROP TABLE IF EXISTS preferences;
CREATE TABLE preferences (
person_id INT UNSIGNED NOT NULL,
album_id INT UNSIGNED NOT NULL,
CONSTRAINT preferences_person_id_fk FOREIGN KEY (person_id) REFERENCES persons (id),
CONSTRAINT preferences_album_id_fk FOREIGN KEY (album_id) REFERENCES albums (id)
);

INSERT INTO preferences (person_id, album_id) VALUES (1, 12), (1, 5), (1, 22), (1, 29), (2, 1), (2, 31), (2, 30), (3, 11), (3, 26), (3, 25);

SELECT * FROM preferences;

SELECT p.first_name AS name, a.name AS album
FROM persons p
    JOIN preferences pf ON p.id = pf.person_id
    JOIN albums a ON pf.album_id = a.id;

#

USE employees;

SELECT employees.last_name AS name, salaries.salary AS salary FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;
# or this way if name is same =>
SELECT employees.last_name AS name, salaries.salary AS salary FROM employees
JOIN salaries USING (emp_no);
#  or =>
SELECT employees.last_name AS name, salaries.salary AS salary FROM employees NATURAL JOIN salaries;

SELECT salary FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE  d.dept_name = 'Research';

SELECT CONCAT(first_name, ' ', last_name), salary
FROM salaries s JOIN  dept_emp de  ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Research';
# AND s.to_date = '9999-01-01';


# does not return same results =>
# SELECT CONCAT(first_name, ' ', last_name), salary
# FROM salaries s NATURAL JOIN dept_emp de
# NATURAL JOIN departments d
# NATURAL JOIN employees e
# WHERE d.dept_name = 'Research';