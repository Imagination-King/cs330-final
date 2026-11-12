USE my_collection;

-- All movies rated 9.0 and above
SELECT * FROM movies
WHERE rating >= 9.0
ORDER BY rating DESC;

-- All copies of Jurassic Park
SELECT m.name, mc.edition, c.name FROM movies AS m
LEFT JOIN movie_copies AS mc ON m.id = mc.movie_id
LEFT JOIN collections AS c ON mc.collection_id = c.id
WHERE m.name = 'Jurassic Park';

-- All movies with a Blu-Ray copy
SELECT m.name AS 'Blu-Rays' FROM movies AS m
LEFT JOIN movie_copies AS mc ON m.id = mc.movie_id
LEFT JOIN copy_formats AS cf ON mc.id = cf.copy_id
LEFT JOIN formats AS f ON cf.format_id = f.id
WHERE f.name = 'Blu-Ray'
GROUP BY m.name
ORDER BY m.name;

-- All movies in the MCU Phase 1 Box Set
SELECT m.name AS 'MCU Phase 1 Box Set' FROM movies AS m
LEFT JOIN movie_copies AS mc ON m.id = mc.movie_id
LEFT JOIN collections AS c ON mc.collection_id = c.id
WHERE c.name = 'Marvel Cinematic Universe Phase One';

-- All movies tagged Science Fiction
SELECT m.name AS 'Science Fiction movies', m.rel_date FROM movies AS m
LEFT JOIN movie_tags AS mt ON mt.movie_id = m.id
LEFT JOIN tags AS t ON mt.tag_id = t.id
WHERE t.label = 'Science Fiction'
ORDER BY m.rel_date;

-- Number of movies in each format
SELECT f.name AS format, COUNT(mc.id) AS count FROM formats AS f
LEFT JOIN copy_formats AS cf ON f.id = cf.format_id
LEFT JOIN movie_copies AS mc ON cf.copy_id = mc.id
GROUP BY f.name;

-- All titles tagged with Adventure
SELECT m.name AS title, 'Movie' AS type
FROM movies m
JOIN movie_tags mt ON m.id = mt.movie_id
JOIN tags t ON mt.tag_id = t.id
WHERE t.label = 'Science Fiction'

UNION

SELECT tv.name AS title, 'TV Show' AS type
FROM tv_shows tv
JOIN tv_tags tt ON tv.id = tt.tv_id
JOIN tags t ON tt.tag_id = t.id
WHERE t.label = 'Adventure';

