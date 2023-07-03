DROP DATABASE IF EXISTS medical_center_ex;

CREATE DATABASE medical_center_ex;


\c medical_center_ex

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialization TEXT NOT NULL
)

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  contact_info TEXT NOT NULL
)

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER NOT NULL REFERENCES doctors(id)  ON DELETE CASCADE,
  patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  visit_date DATETIME NOT NULL
)


CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL,
  description TEXT NOT NULL
)

CREATE TABLE diagnoses (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  disease_id INTEGER NOT NULL REFERENCES diseases(id) ON DELETE CASCADE
)