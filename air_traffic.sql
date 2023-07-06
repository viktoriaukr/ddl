-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic



CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);


CREATE TABLE from_to_country(
  id SERIAL PRIMARY KEY,
  from_to_country TEXT NOT NULL
);

CREATE TABLE from_to_city( 
  id SERIAL PRIMARY KEY,
  from_to_city TEXT NOT NULL
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  from_city TEXT NOT NULL,
  from_country_id INTEGER REFERENCES from_to_country ON DELETE CASCADE,
  to_city TEXT NOT NULL,
  to_country_id INTEGER REFERENCES from_to_country ON DELETE CASCADE
);




INSERT INTO passengers 
  (first_name, last_name, seat)
VALUES 
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


INSERT INTO airline(airline)
VALUES 
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO from_to_country(
  from_to_country
)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

INSERT INTO from_to_city(from_to_city)
VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo'),
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Chicago'),
  ('New Orleans'),
  ('Santiago');

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city, from_country_id, to_city, to_country_id)
VALUES
  ( 1, '33B',  '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
  ( 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 11, 6),
  ( 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 12, 1),
  ( 1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 13, 7),
  ( 4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 3, 14, 8),
  ( 2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 4, 15, 9),
  ( 5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 9, 1),
  ( 6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 16, 1),
  ( 5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 17, 1),
  ( 7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 5, 18, 10);