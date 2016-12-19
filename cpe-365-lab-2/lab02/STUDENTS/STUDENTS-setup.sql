/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `teachers`(Last VARCHAR(12) NOT NULL, First VARCHAR(12) NOT NULL, Classroom INT NOT NULL PRIMARY KEY);
CREATE TABLE `list`(Last VARCHAR(15) NOT NULL, First VARCHAR(15) NOT NULL, Grade INT NOT NULL, Classroom INT NOT NULL, FOREIGN KEY(Classroom) REFERENCES `teachers`(Classroom), PRIMARY KEY(Last, First));
