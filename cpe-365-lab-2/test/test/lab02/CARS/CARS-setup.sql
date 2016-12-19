/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `continents`(
    ContId INT NOT NULL PRIMARY KEY, 
    Name VARCHAR(10) NOT NULL
);

CREATE TABLE `countries`(
    CountryId INT NOT NULL PRIMARY KEY, 
    Name VARCHAR(15) NOT NULL, 
    Continent INT NOT NULL, 
    FOREIGN KEY(Continent) REFERENCES `continents`(ContId)
);

CREATE TABLE `car-makers`(
    Id INT NOT NULL PRIMARY KEY, 
    Short VARCHAR(15) NOT NULL, 
    Name VARCHAR(25) NOT NULL, 
    Country INT, FOREIGN KEY(Country) REFERENCES `countries`(CountryId)
);

CREATE TABLE `model-list`(
    ModelId INT NOT NULL PRIMARY KEY, 
    Maker INT NOT NULL, 
    Model VARCHAR(15) NOT NULL, 
    FOREIGN KEY(Maker) REFERENCES `car-makers`(Id), 
    UNIQUE(Model)
);

CREATE TABLE `car-names`(
    MakeId INT NOT NULL PRIMARY KEY, 
    Model VARCHAR(15) NOT NULL, 
    Description VARCHAR(50) NOT NULL, 
    FOREIGN KEY(Model) REFERENCES `model-list`(Model)
);

CREATE TABLE `cars-data`(
    Id INT NOT NULL PRIMARY KEY, 
    Mpg INT, 
    Cylinders INT NOT NULL, 
    Edispl INT NOT NULL, 
    Horsepower INT, 
    Weight INT NOT NULL, 
    Accelerate FLOAT NOT NULL, 
    Year INT NOT NULL, 
    FOREIGN KEY(Id) REFERENCES `car-names`(MakeId)
);
