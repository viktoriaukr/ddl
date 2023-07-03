DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL,
  pl_count INTEGER NOT NULL,
  location TEXT NOT NULL
)



CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  age INTEGER NOT NULL,
  team_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE
)

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
)

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  team1_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
  team2_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
  referee_id INTEGER NOT NULL REFERENCES referee(id) ON DELELETE CASCADE,
  match_date DATETIME NOT NULL
)



CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player_id INTEGER NOT NULL,
  match_id INTEGER NOT NULL,
  goal_time TIME NOT NULL,
  description TEXT DEFAULT 'No description'
)



CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  season_start_date TIMESTAMP NOT NULL,
  season_end_date TIMESTAMP NOT NULL,
  description TEXT DEFAULT 'No description'
)


CREATE TABLE standings (
  team_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
  season_id INTEGER NOT NULL REFERENCES seasons(id) ON DELETE CASCADE,
  points INTEGER NOT NULL,
  position TEXT NOT NULL,
  description TEXT DEFAULT 'No description'
)