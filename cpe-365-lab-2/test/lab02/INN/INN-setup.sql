/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `Rooms`(RoomId VARCHAR(3) PRIMARY KEY, Name VARCHAR(40), Beds INT, BedType VARCHAR(10), Max INT, Price INT, Decor VARCHAR(15));
CREATE TABLE `Reservations`(Code INT, Room VARCHAR(3), CheckIn DATE, CheckOut DATE, Rate FLOAT, LastName VARCHAR(20), FirstName VARCHAR(20), Adults INT, Kids INT, FOREIGN KEY(Room) REFERENCES `Rooms`(RoomId));