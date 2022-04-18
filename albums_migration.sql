USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(20),
    name VARCHAR(20),
    release_date DATE,
    sales FLOAT,
    genre VARCHAR(20)
);
DESCRIBE albums;
SHOW CREATE TABLE albums;