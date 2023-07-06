-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits_around (
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL
);


CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits_around (id) ON DELETE CASCADE,
  galaxy_ID INTEGER REFERENCES galaxy (id) ON DELETE CASCADE
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO orbits_around ( orbits_around )
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');


INSERT INTO galaxy (galaxy)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy_ID)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);


  INSERT INTO moons ( moon_name, planet_id )
  VALUES
    ("The Moon", 1),
    ("Phobos", 2),
    ("Deimos", 2),
    ("Naiad", 3),
    ("Thalassa", 3),
    ("Despina", 3),
    ("Galatea", 3),
    ("Larissa", 3),
    ("S/2004 N 1", 3),
    ("Proteus", 3),
    ("Triton", 3),
    ("Nereid", 3),
    ("Halimede", 3),
    ("Sao", 3),
    ("Laomedeia", 3),
    ("Psamathe", 3),
    ("Neso", 3);