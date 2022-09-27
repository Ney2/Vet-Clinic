/* Populate database with sample data. */

/* Insert data to animals table*/
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '11-15-2018', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '05-12-2017', 5, true, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Charmander', '02-08-2020', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Plantmon', '11-15-2021', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Squirtle', '04-02-1993', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Angemon', '01-12-2005', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Boarmon', '01-07-2005', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Blossom', '10-13-1998', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neurered, weight_kg) VALUES ('Ditto', '05-14-2022', 4, true, 22);

/*Insert data to owners table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert data to species table */
INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

/* Update animals table */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name ='Boarmon';

/* Insert data to vets table */
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '04-23-2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '01-17-2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '05-04-1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '01-08-2008');

/* Insert data to specializations table */
INSERT INTO specializations (species_id, vet_id) VALUES (1,1);
INSERT INTO specializations (species_id, vet_id) VALUES (1,3);
INSERT INTO specializations (species_id, vet_id) VALUES (2,3);
INSERT INTO specializations (species_id, vet_id) VALUES (2,4);

/* Insert data to visits table */
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 1, '05-24-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 1, '07-22-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 2, '02-02-2021');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '01-05-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '03-08-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '05-14-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 4, '05-04-2021');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 5, '02-24-2021');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6, '12-21-2019');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 6, '08-10-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6, '04-07-2021');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 7, '09-29-2019');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 8, '10-03-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 8, '11-04-2020');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '01-24-2019');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '05-15-2019');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '02-27-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';