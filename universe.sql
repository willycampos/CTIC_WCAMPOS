-- Connect to PostgreSQL
-- psql --username=freecodecamp --dbname=postgres

-- Step 2: Create the `universe` Database
CREATE DATABASE universe;

-- Step 3: Connect to the `universe` Database
\c universe

-- Step 4: Create Tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    type VARCHAR(50) NOT NULL,
    distance_from_earth NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    radius NUMERIC NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    has_water BOOLEAN NOT NULL
);

CREATE TABLE astronaut (
    astronaut_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    mission TEXT NOT NULL,
    age INT NOT NULL,
    is_retired BOOLEAN NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL
);

-- Step 5: Insert Sample Data

-- Insert into galaxy
INSERT INTO galaxy (name, description, type, distance_from_earth, has_life)
VALUES
('Milky Way', 'Our home galaxy.', 'Spiral', 0, TRUE),
('Andromeda', 'Closest spiral galaxy.', 'Spiral', 2537000, FALSE),
('Triangulum', 'Part of the Local Group.', 'Spiral', 3000000, FALSE),
('Whirlpool', 'Famous interacting galaxy.', 'Spiral', 23000000, FALSE),
('Pinwheel', 'Large spiral galaxy.', 'Spiral', 21000000, FALSE),
('Cartwheel', 'Lenticular and ring galaxy.', 'Ring', 500000000, FALSE);

-- Insert into star
INSERT INTO star (name, type, age_in_millions_of_years, galaxy_id, is_spherical)
VALUES
('Sun', 'G-Type Main-Sequence', 4600, 1, TRUE),
('Proxima Centauri', 'M-Type Main-Sequence', 4600, 2, TRUE),
('Betelgeuse', 'Red Supergiant', 8000, 1, TRUE),
('Rigel', 'Blue Supergiant', 8000, 1, TRUE),
('Vega', 'A-Type Main-Sequence', 500, 3, TRUE),
('Sirius', 'A-Type Main-Sequence', 300, 2, TRUE);

-- Insert into planet
INSERT INTO planet (name, type, age_in_millions_of_years, star_id, has_life)
VALUES
('Earth', 'Terrestrial', 4500, 1, TRUE),
('Mars', 'Terrestrial', 4500, 1, FALSE),
('Jupiter', 'Gas Giant', 4500, 1, FALSE),
('Proxima b', 'Terrestrial', 4600, 2, FALSE),
('Alpha Centauri Bb', 'Terrestrial', 4600, 2, FALSE),
('Betelgeuse I', 'Gas Giant', 8000, 3, FALSE),
('Betelgeuse II', 'Gas Giant', 8000, 3, FALSE),
('Rigel I', 'Terrestrial', 8000, 4, FALSE),
('Rigel II', 'Gas Giant', 8000, 4, FALSE),
('Vega I', 'Terrestrial', 500, 5, FALSE),
('Sirius I', 'Gas Giant', 300, 6, FALSE),
('Sirius II', 'Terrestrial', 300, 6, FALSE);

-- Insert into moon
INSERT INTO moon (name, radius, planet_id, has_water)
VALUES
('Moon', 1737.1, 1, FALSE),
('Phobos', 11.267, 2, FALSE),
('Deimos', 6.2, 2, FALSE),
('Europa', 1560.8, 3, TRUE),
('Ganymede', 2634.1, 3, FALSE),
('Callisto', 2410.3, 3, FALSE),
('Io', 1821.6, 3, FALSE),
('Titan', 2575.5, 3, TRUE),
('Enceladus', 252.1, 3, TRUE),
('Rhea', 764.3, 3, FALSE),
('Proxima b I', 1000, 4, FALSE),
('Proxima b II', 1100, 4, FALSE),
('Alpha Centauri Bb I', 500, 5, FALSE),
('Betelgeuse I-a', 3000, 6, FALSE),
('Betelgeuse I-b', 3200, 6, FALSE),
('Rigel I-a', 2000, 8, FALSE),
('Rigel II-a', 2100, 9, FALSE),
('Vega I-a', 700, 10, FALSE),
('Sirius I-a', 900, 11, FALSE),
('Sirius II-a', 800, 12, FALSE);

-- Insert into astronaut
INSERT INTO astronaut (name, mission, age, is_retired, planet_id)
VALUES
('Neil Armstrong', 'Apollo 11', 82, TRUE, 1),
('Buzz Aldrin', 'Apollo 11', 91, TRUE, 1),
('Yuri Gagarin', 'Vostok 1', 34, TRUE, 2),
('Sally Ride', 'STS-7', 61, TRUE, 1),
('Chris Hadfield', 'Expedition 35', 62, TRUE, 1),
('Valentina Tereshkova', 'Vostok 6', 86, TRUE, 2),
('Elon Musk', 'SpaceX Mission', 52, FALSE, 3),
('Mark Watney', 'Ares 3', 35, FALSE, 2),
('Mae Jemison', 'STS-47', 67, TRUE, 1);

-- Verify the Structure and Data
\d galaxy
\d star
\d planet
\d moon
\d astronaut

SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
SELECT * FROM astronaut;
