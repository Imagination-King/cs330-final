USE my_collection;

ALTER TABLE movies
ADD COLUMN cover_image VARCHAR(255);

ALTER TABLE tv_shows
ADD COLUMN cover_image VARCHAR(255);

ALTER TABLE collections RENAME box_sets,
ADD COLUMN cover_image VARCHAR(255);

CREATE TABLE tv_volumes( -- represents physical copies of full series, individual seasons, or collections of episodes
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    show_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    details VARCHAR(255),
    format
    cover_image VARCHAR(255),
    FOREIGN KEY (show_id) REFERENCES tv_shows(id)
);

CREATE TABLE tv_episodes( -- represents individual episdoes of shows
    show_id INTEGER NOT NULL,
    production_number INTEGER NOT NULL,
    season_number INTEGER NOT NULL,
    ep_number INTEGER NOT NULL,
    PRIMARY KEY(show_id, production_number),
    FOREIGN KEY (show_id) REFERENCES tv_shows(id)
);

CREATE TABLE volume_episode( -- identifies which episodes appear on which physical copy
    vol_id INTEGER NOT NULL,
    show_id INTEGER NOT NULL,
    production_number INTEGER NOT NULL,
    PRIMARY KEY(show_id, vol_id, production_number),
    FOREIGN KEY (vol_id) REFERENCES tv_volumes(id),
    FOREIGN KEY(show_id, production_number)
        REFERENCES tv_episodes(show_id, production_number)
);

CREATE TABLE volume_formats(
    volume_id INTEGER,
    format_id INTEGER,
    PRIMARY KEY(volume_id, format_id),
    FOREIGN KEY (volume_id) REFERENCES tv_volumes(id),
    FOREIGN KEY (format_id) REFERENCES formats(id)
)