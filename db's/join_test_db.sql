CREATE DATABASE IF NOT EXISTS join_test_db;


CREATE TABLE IF NOT EXISTS roles (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
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
('mike', 'mike@example.com', null),
('chris', 'chris@berry.com', 1),
('oscar', 'o-man@alex.com', 4),
('javier', 'javier@codeup.com', 2),
('finn', 'finnigan@floofster.com', NULL);

SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;