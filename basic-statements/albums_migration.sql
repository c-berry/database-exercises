USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    artist VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    release_date VARCHAR(20),
    sales FLOAT,
    genre CHAR(200),
    PRIMARY KEY (id)
);
DESCRIBE albums;
SHOW CREATE TABLE albums;

INSERT INTO albums (artist, name, release_date, sales, genre) VALUES ('Sublime', 'Self-Titled', 1996, 50, 'Ska punk, alt rock');
INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Devendra Banahrt', 'Smokey Rolls Down Thunder Canyon', 2007, 10, 'alternative, Indie folk');
INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('The Black Angels', 'Phosephene Dream', 2010, 10, 'Psych rock');
INSERT INTO albums (artist, name, release_date, sales, genre) VALUES ('Portishead', 'Dummy', 1994, 10, 'Trip-hop');
INSERT INTO albums (artist, name, release_date, sales, genre) VALUES ('Pink Floyd', 'The Dark Side of the Moon', 1973, 10,'Psych-rock');

SELECT * FROM albums WHERE release_date < 2000;
SELECT artist FROM albums WHERE sales > 1000000;

UPDATE albums SET artist = 'Portishead2'
WHERE artist = 'Portishead';

