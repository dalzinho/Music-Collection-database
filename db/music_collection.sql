DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS albums CASCADE;

CREATE TABLE artists (
  artist_id SERIAL4 primary key,
  name VARCHAR(255)
  );

CREATE TABLE albums (
  album_id SERIAL4 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 references artists(artist_id)

);