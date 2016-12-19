/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `airlines`(
    Id INT NOT NULL,
    Airline VARCHAR(20) NOT NULL, 
    Abbrev VARCHAR(15), 
    Country VARCHAR(3),
    PRIMARY KEY(Id)
);


CREATE TABLE `airports100`(
    City VARCHAR(25),
    Code VARCHAR(3), 
    Name VARCHAR(60), 
    Country VARCHAR(15), 
    Cabbrev VARCHAR(3),
    PRIMARY KEY(Code)
);

CREATE TABLE `flights`(
    Airline INT NOT NULL,
    FlightNo INT, 
    Source VARCHAR(3), 
    Dest VARCHAR(3), 
    FOREIGN KEY(Airline) REFERENCES `airlines`(Id),
    FOREIGN KEY(Source) REFERENCES `airports100`(Code),
    FOREIGN KEY(Dest) REFERENCES `airports100`(Code),
    PRIMARY KEY(Airline, FlightNo)
);
