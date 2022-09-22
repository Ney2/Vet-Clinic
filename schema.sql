/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species VARCHAR(100),
    PRIMARY KEY(id)
);

/* Database schema for owners */
CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (ID)
);

/* Database schema for species */
CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

/* Update animals table */
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals Add COLUMN owner_id INT REFERENCES owners(id);

/* Create vets table */
CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

/* Create join table named specializations */
CREATE TABLE specializations (
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id),
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(vet_id) REFERENCES vets(id)
);

/* Create join table named visits */
CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    PRIMARY KEY(animal_id, vet_id, visit_date),
    FOREIGN KEY(animal_id) REFERENCES animals(id),
    FOREIGN KEY(vet_id) REFERENCES vets(id)
);
