-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE
);


CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011',, 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists ( artist_name, song_id)
VALUES
  ("Hanson", 1),
  ("Queen", 2),
  ("Mariah Cary", 3),
  ("Boyz II Men", 3),
  ("Bradley Cooper", 4),
  ("Lady Gaga", 4),
  ("Nickelback", 5),
  ("Jay Z", 6),
  ("Alicia Keys", 6),
  ("Katy Perry", 7),
  ("Juicy J", 7),
  ( "Christina Aguilera", 8),
  ("Maroon 5", 8),
  ("Avril Lavigne", 9), 
  ("Destiny''s Child", 10);



INSERT INTO artists ( producer_name, song_id)
VALUES
  ("Dust Brothers", 1),
  ("Stephen Lironi", 1),
  ("Roy Thomas Baker", 2),
  ("Walter Afanasieff", 3),
  ("Rick Parashar", 5),
  ("Al Shux", 6),
  ("Max Martin", 7),
  ("Cirkut", 7),
  ("Shellback", 8),
  ("Benny Blanco", 8),
  ("The Matrix", 9),
  ("Benjamin Rice", 4),
  ("Darkchild", 10);
