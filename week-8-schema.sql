DROP DATABASE collection;
CREATE DATABASE my_collection;

USE my_collection;

CREATE TABLE collections( -- box sets of movies
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE movies( -- information about individual movies
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    rel_date DATE,
    rating DECIMAL(4,2) CHECK (rating >= 0.00 AND rating <= 10.00), -- three digits, with at most two of them allowed on right side of decimal 0.00 -> 10.0
    review TEXT
);

CREATE TABLE movie_copies( -- information about individual copies
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    edition VARCHAR(255),
    movie_id INTEGER NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    collection_id INTEGER,
    FOREIGN KEY (collection_id) REFERENCES collections(id)
);

CREATE TABLE tv_shows( -- individual seasons or complete series
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    status ENUM('completed', 'airing', 'on hold') NOT NULL,
    ep_count INTEGER,
    rating DECIMAL(4,2) CHECK (rating >= 0.00 AND rating <= 10.00), -- three digits, with at most two of them allowed on right side of decimal 0.00 -> 10.0
    review TEXT
);

CREATE TABLE formats(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(31) NOT NULL UNIQUE
);

CREATE TABLE copy_formats(
    copy_id INTEGER,
    format_id INTEGER,
    PRIMARY KEY(copy_id, format_id),
    FOREIGN KEY (copy_id) REFERENCES movie_copies(id),
    FOREIGN KEY (format_id) REFERENCES formats(id)
);

CREATE TABLE tags(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(31) NOT NULL UNIQUE
);

CREATE TABLE movie_tags(
    movie_id INTEGER,
    tag_id INTEGER,    
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (movie_id, tag_id)
);

CREATE TABLE tv_tags(
    tv_id INTEGER,
    tag_id INTEGER,
    FOREIGN KEY (tv_id) REFERENCES tv_shows(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (tv_id, tag_id)
);