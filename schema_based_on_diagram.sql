CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INTEGER NOT NULL,
  status VARCHAR NOT NULL,
  CONSTRAINT fkey_patients FOREIGN KEY(patient_id) REFERENCES patients(id),
  PRIMARY KEY(id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT NOT NULL,
  CONSTRAINT fkey_medical_history_invoices FOREIGN KEY(medical_history_id) REFERENCES  medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  CONSTRAINT fkey_invoice FOREIGN KEY(invoice_id) REFERENCES  invoices(id),
  CONSTRAINT fkey_treatments FOREIGN KEY(treatment_id) REFERENCES  treatments(id),
  PRIMARY KEY(id)
);

-- Bridging/joining table
CREATE TABLE treatment_history (
  medical_id INT,
  treatment_id INT,
  CONSTRAINT fk_medical FOREIGN KEY (medical_id) REFERENCES medical_histories(id),
  CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);