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

