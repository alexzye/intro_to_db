/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `appellations`(
    Id INT NOT NULL, 
    Appellation VARCHAR(50), 
    County VARCHAR(20), 
    State VARCHAR(15), 
    Area VARCHAR(20), 
    isAVA VARCHAR(5),
    PRIMARY KEY(Id),
    UNIQUE(Appellation)
);

CREATE TABLE `grapes`(
    Id INT NOT NULL, 
    Grape VARCHAR(25), 
    Color VARCHAR(10), 
    PRIMARY KEY(Id),
    UNIQUE(Grape)
);

CREATE TABLE `wine`(
    Id INT NOT NULl, 
    Grape VARCHAR(25), 
    Winery VARCHAR(40), 
    Appellation VARCHAR(50), 
    State VARCHAR(15), 
    Name VARCHAR(50), 
    Year INT, 
    Price INT, 
    Score INT, 
    Cases INT, 
    Drink VARCHAR(7), 
    FOREIGN KEY(Grape) REFERENCES `grapes`(Grape), 
    FOREIGN KEY(Appellation) REFERENCES `appellations`(Appellation),
    PRIMARY KEY(Id)
);


