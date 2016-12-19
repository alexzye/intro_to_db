/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `Rooms`(
    RoomId VARCHAR(3), 
    Name VARCHAR(40), 
    Beds INT, 
    BedType VARCHAR(10), 
    Max INT, 
    Price FLOAT, 
    Decor VARCHAR(15),
    PRIMARY KEY(RoomId)
);

CREATE TABLE `Reservations`(
    Code INT, 
    Room VARCHAR(3), 
    CheckIn DATE, 
    CheckOut DATE, 
    Rate FLOAT, 
    LastName VARCHAR(20), 
    FirstName VARCHAR(20), 
    Adults INT, 
    Kids INT, 
    FOREIGN KEY(Room) REFERENCES `Rooms`(RoomId),
    PRIMARY KEY(Code),
    UNIQUE(Room, CheckIn)
);
