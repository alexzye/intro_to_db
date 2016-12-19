/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `continents`(
    ContId INT NOT NULL,  
    Name VARCHAR(10) NOT NULL,
    PRIMARY KEY(ContId) 
);

CREATE TABLE `countries`(
    CountryId INT NOT NULL, 
    Name VARCHAR(15) NOT NULL, 
    Continent INT NOT NULL, 
    FOREIGN KEY(Continent) REFERENCES `continents`(ContId),
    PRIMARY KEY(CountryId)
);

CREATE TABLE `car-makers`(
    Id INT NOT NULL,  
    Short VARCHAR(15) NOT NULL, 
    Name VARCHAR(25) NOT NULL, 
    Country INT, 
    FOREIGN KEY(Country) REFERENCES `countries`(CountryId),
    PRIMARY KEY(Id)
);

CREATE TABLE `model-list`(
    ModelId INT NOT NULL, 
    Maker INT NOT NULL, 
    Model VARCHAR(15) NOT NULL, 
    FOREIGN KEY(Maker) REFERENCES `car-makers`(Id), 
    PRIMARY KEY(ModelId), 
    UNIQUE(Model)
);

CREATE TABLE `car-names`(
    MakeId INT NOT NULL, 
    Model VARCHAR(15) NOT NULL, 
    Description VARCHAR(50) NOT NULL, 
    PRIMARY KEY(MakeId),
    FOREIGN KEY(Model) REFERENCES `model-list`(Model)
);

CREATE TABLE `cars-data`(
    Id INT NOT NULL, 
    Mpg FLOAT, 
    Cylinders INT NOT NULL, 
    Edispl FLOAT NOT NULL, 
    Horsepower INT, 
    Weight INT NOT NULL, 
    Accelerate FLOAT NOT NULL, 
    Year INT NOT NULL, 
    FOREIGN KEY(Id) REFERENCES `car-names`(MakeId),
    PRIMARY KEY(Id)
);
