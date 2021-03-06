USE codeup_test_db;

SELECT 'Albums released after 1991.' AS  caption, albums.* FROM albums WHERE release_date > 1991;
# or:
# SELECT name AS 'Albums released after 1991.' FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE release_date > 1991;

SELECT name AS 'Albums with genre ''disco''' FROM albums WHERE genre = 'disco';
DELETE FROM albums WHERE genre = 'disco';

SELECT name AS 'Albums by Whitney Houston' FROM albums WHERE artist = 'Whitney Houston';
DELETE FROM albums WHERE artist = 'Whitney Houston';