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
  PRIMARY KEY(id));

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT NOT NULL,
  CONSTRAINT fkey_medical_history_invoices FOREIGN KEY(medical_history_id) REFERENCES TO medical_histories(id)
  PRIMARY KEY(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  CONSTRAINT fkey_medical_history_treatments FOREIGN KEY(medical_history_id) REFERENCES TO medical_histories(id)
  PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fkey_invoice FOREIGN KEY(invoices_id) REFERENCES TO invoices(id);
  CONSTRAINT fkey_treatments FOREIGN KEY(treatment_id) REFERENCES TO treatments(id);
  PRIMARY KEY(id)
);

