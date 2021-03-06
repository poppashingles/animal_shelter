DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  photo_url VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  adoptable BOOLEAN,
  admission_date DATE,
  -- adopted_date DATE,
  photo_url VARCHAR(255),
  owner_id INT4 REFERENCES owners(id)
);

CREATE TABLE users (
  id SERIAL4 primary key,
  name VARCHAR(255),
  password VARCHAR(255)
);
