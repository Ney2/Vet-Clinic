/* Populate database with sample data. */

/* Add data to animals table*/
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

/*Add data to owners table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Add data to species table */
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