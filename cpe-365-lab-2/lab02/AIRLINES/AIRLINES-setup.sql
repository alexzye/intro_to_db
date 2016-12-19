/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `airlines`(Id INT NOT NULL PRIMARY KEY, Airline VARCHAR(20) NOT NULL, Abbrev VARCHAR(15), Country VARCHAR(3));
CREATE TABLE `airports100`(City VARCHAR(25), Code VARCHAR(4) PRIMARY KEY, Name VARCHAR(60), Country VARCHAR(15), Cabbrev VARCHAR(3));
CREATE TABLE `flights`(Airline INT NOT NULL, FlightNo INT, Source VARCHAR(4), Dest VARCHAR(4), FOREIGN KEY(Source) REFERENCES `airports100`(Code), UNIQUE(Airline, FlightNo));