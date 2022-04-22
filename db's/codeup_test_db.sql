CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;

DROP TABLE IF EXISTS quotes;
CREATE TABLE IF NOT EXISTS quotes
(
    id      INT          NOT NULL AUTO_INCREMENT,
    content VARCHAR(240) NOT NULL,
    author  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO quotes (content, author)
VALUES ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.',
        'Marcel Proust'),
       ('My destination is no longer a place, rather a new way of seeing.', 'Marcel Proust'),
       ('Reading is that fruitful miracle of a communication in the midst of solitude.', 'Marcel Proust'),
       ('Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.',
        'Neil Gaiman'),
       ('I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.',
        'Neil Gaiman'),
       ('I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it',
        'Neil Gaiman');

SELECT * FROM quotes;

DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO authors (author_name)
VALUES ('Marcel Proust'),
       ('Neil Gaiman');

SELECT * FROM authors;

ALTER TABLE quotes
    ADD COLUMN author_id INT UNSIGNED NOT NULL;

UPDATE quotes
SET author_id = (SELECT id FROM authors WHERE author_name = 'Marcel Proust')
WHERE author = 'Marcel Proust';

UPDATE quotes
SET author_id = (SELECT id FROM authors WHERE author_name = 'Neil Gaiman')
WHERE author = 'Neil Gaiman';
# or =>
# SET @neil_gaiman_id := (SELECT id FROM authors WHERE author_name = 'Neil Gaiman');
# UPDATE quotes
# SET author_id = @neil_gaiman_id
# WHERE author = 'Neil Gaiman';

ALTER TABLE quotes
    DROP COLUMN author;
ALTER TABLE quotes
    ADD CONSTRAINT quotes_author_id_fk FOREIGN KEY (author_id) REFERENCES authors (id);

DROP TABLE IF EXISTS topics;
CREATE TABLE  IF NOT EXISTS topics
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    topic VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO topics (topic)
VALUES ('literature'),
       ('philosophy'),
       ('inspiration'),
       ('hope');

SELECT * FROM topics;

DROP TABLE IF EXISTS quote_topics;
CREATE TABLE IF NOT EXISTS quote_topics
(
    quote_id INT          NOT NULL,
    topic_id INT UNSIGNED NOT NULL,
    CONSTRAINT quote_topics_quote_id_fk FOREIGN KEY (quote_id) REFERENCES quotes (id),
    CONSTRAINT quote_topics_topic_id_fk FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topics (quote_id, topic_id)
VALUES (1, 2),
       (1, 3),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 2),
       (4, 1),
       (4, 3),
       (5, 3),
       (5, 4),
       (6, 3),
       (6, 4);

SELECT * FROM quote_topics;

SELECT content, author_name AS author
FROM authors a
         JOIN quotes q ON a.id = q.author_id
         JOIN quote_topics qt ON q.id = qt.quote_id
         JOIN topics t ON qt.topic_id = t.id
WHERE topic = 'hope';

