/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `marathon`(
    Place INT NOT NULL, 
    Time TIME, 
    Pace TIME, 
    GroupPlace INT, 
    GroupNum VARCHAR(6), 
    Age INT, 
    Sex CHAR(1), 
    Bib INT, 
    First VARCHAR(15), 
    Last VARCHAR(15), 
    Town VARCHAR(15), 
    State VARCHAR(2),
    PRIMARY KEY(Place)
);
