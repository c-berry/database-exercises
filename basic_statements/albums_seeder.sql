USE codeup_test_db;
TRUNCATE albums;

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Michael Jackson','Thriller',1982,49.2, 'Pop, post-disco, funk, rock'),
       ('AC/DC','Back in Black',1980,29.5,'Hard Rock'),
       ('Whitney Houston','The Bodyguard',1992,32.4,'R&B, Soul, Pop, Soundtrack'),
       ('Meat Loaf','Bat Out of Hell',1977,21.7,'Hard Rock, Glam Rock, Progressive Rock'),
       ('Eagles','Their Greatest Hits (1971-1975)',1976,41.2,'Country Rock, Soft Rock, Folk Rock'),
       ('Pink Floyd','The Dark Side of the Moon',1973,24.4,'Progressive Rock'),
       ('Eagles','Hotel California',1976,31.5,'Soft Rock'),
       ('Bee Gees','Saturday Night Fever',1977,21.6,'Disco'),
       ('Fleetwood Mac','Rumors',1977,27.9,'Soft Rock'),
       ('Shania Twain','Come On Over',1997,29.6,'Country, Pop'),
       ('Various','Grease: The Original Soundtrack from the Motion Picture',1978,14.4,'Rock and Roll'),
       ('Led Zeppelin','Led Zeppelin IV',1971,29.0,'Hard Rock, Heavy Metal, Folk Rock'),
       ('Michael Jackson','Bad',1987,21.1,'Pop, Rythm and Blues, Funk, Rock'),
       ('Alanis Morissette','Jagged Little Pill',1995,24.3,'Alternative Rock'),
       ('Michael Jackson','Dangerous',1991,17.0,'New Jack Swing, R&B, Pop'),
       ('Celine Dion','Falling into You',1996,21.1,'Pop, Soft Rock'),
       ('The Beatles','Sgt. Pepper''s Lonely Hearts Club Band',1967,18.2,'Rock'),
       ('Various','Dirty Dancing',1987,17.9,'Pop, Rock, R&B'),
       ('Adele','21',2011,26.4,'Pop, Soul'),
       ('Celine Dion','Let''s Talk About Love',1997,19.3,'Pop, Soft Rock'),
       ('Metallica','Metallica',1991,25.2,'Heavy Metal'),
       ('The Beatles','1',2000,23.5,'Rock'),
       ('The Beatles','Abbey Road',1969,14.4,'Rock'),
       ('ABBA','Gold: Greatest Hits',1992,23.0,'Pop, Disco'),
       ('Bruce Springsteen','Born in the U.S.A.',1984,19.6,'Heartland Rock'),
       ('Madonna','The Immaculate Collection',1990,19.5,'Pop, Dance'),
       ('Pink Floyd','The Wall',1979,18.7,'Progressive Rock'),
       ('James Horner','Titanic: Music from the Motion Picture',1997,18.1,'Film Score'),
       ('Dire Straits','Brothers in Arms',1985,17.7,'Roots Rock, Blues Rock, Soft Rock'),
       ('Nirvana','Nevermind',1991,16.7,'Grunge, Alternative Rock'),
       ('Santana','Supernatural',1999,20.5,'Latin Rock'),
       ('Guns N'' Roses','Appetite for Destruction',1987,21.9,'Hard Rock'),
       ('Elton John','Goodbye Yellow Brick Road',1973,8.5,'Rock, Pop Rock, Glam Rock');

SELECT * FROM albums;