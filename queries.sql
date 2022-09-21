/* Queries that provide answers to the questions from all projects. */

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-3-12';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transaction for setting species column to unspecified */
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

/* Transaction for setting species column to digimon and pokemon */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'digimon' WHERE species IS NULL;
COMMIT;

/* Transcation for deleting all records inside the animal table */
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* Transcation using savepoint */
BEGIN;
DELETE from animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT sp1;
UPDATE animals set weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals set weight_kg = weight_kg *-1 WHERE weight_kg < 0;
COMMIT;

/* Transaction using aggregate functions */
SELECT COUNT(id) from animals;
SELECT COUNT(id) from animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) from animals;
SELECT neutered, max(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' GROUP BY species;