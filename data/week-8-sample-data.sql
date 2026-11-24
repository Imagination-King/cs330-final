-- Data generated using ChatGPT. Some information may not be accurate, but is only here to help me practice writing queries.

USE my_collection;

-- ==========================================
-- COLLECTIONS
-- ==========================================

INSERT INTO collections (name) VALUES
('Jurassic Park Ultimate Collection'),
('The Matrix Trilogy'),
('Marvel Cinematic Universe Phase One');


-- ==========================================
-- MOVIES
-- ==========================================

INSERT INTO movies (name, rel_date, rating, review) VALUES
('Jurassic Park', '1993-06-11', 9.50, 'A classic adventure film.'),
('The Lost World: Jurassic Park', '1997-05-23', 7.50, 'Not quite as good as the original.'),
('Jurassic Park III', '2001-07-18', 7.00, 'An enjoyable sequel.'),
('The Matrix', '1999-03-31', 10.00, 'One of my all-time favorites.'),
('The Matrix Reloaded', '2003-05-15', 8.00, 'Interesting continuation.'),
('The Matrix Revolutions', '2003-11-05', 7.50, 'A satisfying conclusion.'),
('Iron Man', '2008-05-02', 9.00, 'A great start to the MCU.'),
('The Incredible Hulk', '2008-06-13', 6.50, 'Decent, but forgettable.'),
('The Avengers', '2012-05-04', 9.50, 'Fantastic ensemble film.'),
('Alien', '1979-06-22', 9.00, 'Excellent science fiction horror.'),
('Aliens', '1986-07-18', 9.50, 'An excellent sequel.');


-- ==========================================
-- MOVIE COPIES
-- ==========================================

-- Collection 1: Jurassic Park Ultimate Collection
-- Collection 2: The Matrix Trilogy
-- Collection 3: Marvel Cinematic Universe Phase One

INSERT INTO movie_copies (edition, movie_id, collection_id) VALUES
-- Jurassic Park collection
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),

-- Matrix collection
(NULL, 4, 2),
(NULL, 5, 2),
(NULL, 6, 2),

-- Marvel collection
(NULL, 7, 3),
(NULL, 8, 3),
(NULL, 9, 3),

-- Standalone purchases
('Theatrical Edition', 1, NULL),
('Director''s Cut', 4, NULL),
('Collector''s Edition', 10, NULL),
(NULL, 10, NULL),
('Special Edition', 11, NULL);


-- ==========================================
-- FORMATS
-- ==========================================

INSERT INTO formats (name) VALUES
('VHS'),
('DVD'),
('Blu-ray'),
('4K UHD');


-- ==========================================
-- COPY FORMATS
-- ==========================================

-- Jurassic Park collection
INSERT INTO copy_formats (copy_id, format_id) VALUES
(1, 2),             -- DVD
(2, 2),             -- DVD
(3, 3),             -- Blu-ray

-- Matrix collection
(4, 2),             -- DVD
(5, 2),             -- DVD
(6, 2),             -- DVD

-- Marvel collection
(7, 3),             -- Blu-ray
(8, 3),             -- Blu-ray
(9, 3),             -- Blu-ray

-- Standalone purchases
(10, 1),            -- VHS
(11, 3), (11, 4),   -- Blu-ray + 4K UHD
(12, 3), (12, 4),   -- Blu-ray + 4K UHD
(13, 3),            -- Blu-ray
(14, 2), (14, 3);   -- DVD + Blu-ray


-- ==========================================
-- TV SHOWS
-- ==========================================

INSERT INTO tv_shows (name, start_date, end_date, status, ep_count, rating, review) VALUES
('Breaking Bad', '2008-01-20', '2013-09-29', 'completed', 62, 10.00, 'Excellent storytelling.'),
('The X-Files', '1993-09-10', '2018-03-21', 'completed', 218, 9.00, 'A fantastic sci-fi series.'),
('Stranger Things', '2016-07-15', NULL, 'airing', NULL, 9.50, 'Great atmosphere and characters.'),
('The Mandalorian', '2019-11-12', NULL, 'on hold', 24, 8.50, 'An enjoyable Star Wars series.'),
('Avatar: The Last Airbender', '2005-02-21', '2008-07-19', 'completed', 61, 10.00, 'An outstanding animated series.');


-- ==========================================
-- TAGS
-- ==========================================

INSERT INTO tags (label) VALUES
('Science Fiction'),
('Action'),
('Adventure'),
('Horror'),
('Drama'),
('Comedy'),
('Animation'),
('Mystery');


-- ==========================================
-- MOVIE TAGS
-- ==========================================

INSERT INTO movie_tags (movie_id, tag_id) VALUES
(1, 1), (1, 3),
(2, 1), (2, 3),
(3, 1), (3, 3),
(4, 1), (4, 2),
(5, 1), (5, 2),
(6, 1), (6, 2),
(7, 1), (7, 2),
(8, 1), (8, 2),
(9, 1), (9, 2),
(10, 1), (10, 4),
(11, 1), (11, 2), (11, 4);


-- ==========================================
-- TV TAGS
-- ==========================================

INSERT INTO tv_tags (tv_id, tag_id) VALUES
(1, 5), (1, 8),
(2, 1), (2, 8), (2, 5),
(3, 1), (3, 5), (3, 8),
(4, 1), (4, 2),
(5, 7), (5, 3), (5, 2);

