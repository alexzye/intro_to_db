/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `Campuses`(
    Id INT NOT NULL, 
    Campus VARCHAR(60) NOT NULL, 
    Location VARCHAR(20) NOT NULL, 
    County VARCHAR(20) NOT NULL, 
    Year INT NOT NULL, 
    PRIMARY KEY(Id), 
    UNIQUE(Id, Campus, Location)
);

CREATE TABLE `csu-fees`(
    Campus INT NOT NULL, 
    Year INT NOT NULL, 
    CampusFee INT NOT NULL, 
    FOREIGN KEY(Campus) REFERENCES `Campuses`(Id),
    PRIMARY KEY(Campus, Year)
);

CREATE TABLE `degrees`(
    Year INT NOT NULL, 
    Campus INT NOT NULL, 
    Degrees FLOAT NOT NULL, 
    FOREIGN KEY(Campus) REFERENCES `Campuses`(Id), 
    PRIMARY KEY(Campus, Year)
);

CREATE TABLE `disciplines`(
    Id INT NOT NULL, 
    Name VARCHAR(30) NOT NULL, 
    PRIMARY KEY(Id)
);

CREATE TABLE `discipline-enrollments`(
    Campus INT NOT NULL, 
    Discipline INT NOT NULL, 
    Year INT NOT NULL, 
    Undergraduate INT NOT NULL, 
    Graduate INT NOT NULL, 
    FOREIGN KEY(Campus) REFERENCES `Campuses`(Id), 
    FOREIGN KEY(Discipline) REFERENCES `disciplines`(Id),
    PRIMARY KEY(Campus, Discipline)
);

CREATE TABLE `enrollments`(
    Campus INT NOT NULL, 
    Year INT NOT NULL, 
    Total FLOAT NOT NULL, 
    FTE FLOAT NOT NULL, 
    FOREIGN KEY(Campus) REFERENCES `Campuses`(Id),
    PRIMARY KEY(Campus, Year)
);

CREATE TABLE `faculty`(
    Campus INT NOT NULL, 
    Year INT NOT NULL, 
    Faculty FLOAT NOT NULL, 
    FOREIGN KEY(Campus) REFERENCES `Campuses`(Id), 
    PRIMARY KEY(Campus, Year)
);
