CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATA NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INTEGER NOT NULL,
  status VARCHAR,
  CONSTRAINT fkey_patients FOREIGN KEY(patient_id) REFERENCES TO patients(id)
);