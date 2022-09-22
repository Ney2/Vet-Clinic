/* Queries that provide answers to the questions FROM all projects. */

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

/*Queries using Join*/
SELECT name, full_name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE O.id =4;
SELECT A.name AS animal_name, S.name AS species_name FROM animals A JOIN species S ON A.species_id = S.id WHERE s.id = 1;
SELECT A.name AS animal_name, full_name AS owner FROM animals A RIGHT JOIN owners O ON A.owner_id = O.id;
SELECT count(A.id) AS total , S.name AS species_name FROM species S JOIN animals A ON A.species_id = S.id GROUP BY S.name;
SELECT A.name AS animal_name, full_name AS owner_name FROM animals A JOIN owners O ON O.id = A.owner_id AND A.species_id = 2 AND O.full_name = 'Jennifer Orwell';
SELECT name AS animal_name, full_name AS owner_name FROM animals A JOIN owners O ON A.owner_id = O.id AND full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT count(A.id), full_name AS owner_name FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY full_name;

/* Multiple table transcation */
SELECT A.name AS animal_name, Vets.name AS visitor, visit_date FROM animals A JOIN visits V ON A.id = V.animal_id JOIN vets ON vet_id = vets.id WHERE vets.id = 1;
SELECT count(A.id) AS total, vets.name AS visitor_name FROM animals A JOIN visits V ON A.id = V.animal_id JOIN vets ON vet_id = vets.id WHERE vets.id = 3 GROUP BY vets.name;
SELECT vets.name, species.name AS species FROM vets left JOIN specializations S ON S.vet_id = vets.id LEFT JOIN species ON species.id = S.species_id ;
SELECT A.name AS visitor, V.name AS visitor, visits.visit_date FROM animals A JOIN visits ON animal_id = A.id JOIN vets V ON vet_id = V.id WHERE V.id = 3 AND visits.visit_date BETWEEN '04-01-2020' AND '08-30-2020';
SELECT count(A.id), vets.name AS visitor FROM animals A JOIN visits V ON A.id = V.animal_id JOIN vets ON vets.id = V.vet_id GROUP BY vets.name;
SELECT vets.name AS visitor, A.name, visits.visit_date FROM animals A JOIN visits ON animal_id = A.id JOIN vets ON vets.id = visits.vet_id WHERE vets.id = 2 ORDER BY visits.visit_date;
SELECT A.name AS animal_name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, species.name, vets.name AS visitor, vets.age, vets.date_of_graduation, visits.visit_date FROM vets JOIN visits ON visits.vet_id = vets.id JOIN animals A ON A.id = visits.animal_id JOIN species ON A.species_id = species.id;
SELECT animals.name AS animal, species.name AS species,vets.name AS vet, vet_sp.name AS specialized FROM vets JOIN visits ON vets.id = visits.vet_id JOIN animals ON visits.animal_id = animals.id JOIN species ON species.id = animals.species_id JOIN specializations ON specializations.vet_id = vets.id JOIN species vet_sp ON vet_sp.id = specializations.species_id WHERE species.id != vet_sp.id;
SELECT species.name AS species FROM vets JOIN visits ON vets.id = visits.vet_id JOIN animals ON visits.animal_id = animals.id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species LIMIT 1;
