CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP  NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price  DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    treatment_id INT REFERENCES treatments(id),
    invoice_id INT REFERENCES invoices(id),
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatment (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (id)
);
