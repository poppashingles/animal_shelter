DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  phone_number INT4
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  adoptable BOOLEAN,
  admission_date DATE,
  adopted_date DATE,
  owner_id INT4 REFERENCES owners(id)
);
