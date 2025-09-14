CREATE TABLE genres(
genre_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL
);
CREATE TABLE artists(
artist_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL
);
CREATE TABLE artists_genres(
artist_id INTEGER NOT NULL,
genre_id INTEGER NOT NULL,
PRIMARY KEY(artist_id, genre_id),
FOREIGN KEY(artist_id) REFERENCES artists(artist_id),
FOREIGN KEY(genre_id) REFERENCES genres(genre_id)
);
CREATE TABLE albums(
album_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
release_date DATE
);
CREATE TABLE artists_albums(
artist_id INTEGER NOT NULL,
album_id INTEGER NOT NULL,
PRIMARY KEY(artist_id, album_id),
FOREIGN KEY(artist_id) REFERENCES artists(artist_id),
FOREIGN KEY(album_id) REFERENCES albums(album_id)
);
CREATE TABLE tracks(
track_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
duration TIME,
album_id INTEGER NOT NULL,
FOREIGN KEY(album_id) REFERENCES albums(album_id)
);
CREATE TABLE compilation(
compilation_id SERIAL PRIMARY KEY,
title VARCHAR(120) NOT NULL,
release_year INTEGER NOT NULL
);
CREATE TABLE compilations_tracks(
compilation_id INTEGER NOT NULL,
track_id INTEGER NOT NULL,
PRIMARY KEY(compilation_id, track_id),
FOREIGN KEY(compilation_id) REFERENCES compilations(compilation_id),
FOREIGN KEY(track_id) REFERENCES tracks(track_id)
);
