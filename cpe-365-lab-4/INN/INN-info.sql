/*
Alex Ye
aye01@calpoly.edu
*/
-- Q1
SELECT r.Name, r.Decor
FROM `Rooms` r
WHERE BedType = "Queen"
AND Beds = 2
AND Price > 160
ORDER BY RoomId;

-- Q2
SELECT res.LastName, res.CheckIn, res.CheckOut, 
res.Adults + res.Kids, res.Rate
FROM `Reservations` res, `Rooms` room
WHERE MONTH(res.CheckIn) = 10
AND MONTH(res.CheckOut) = 10
AND room.RoomId = res.Room
AND room.Name = "Thrift and accolade"
AND res.Rate < room.Price;

-- Q3
SELECT room.Name, res.CheckIn, res.CheckOut
FROM `Reservations` res, `Rooms` room
WHERE "2010-10-24" 
BETWEEN res.CheckIn 
AND res.CheckOut
ORDER BY room.Name;

-- Q4
SELECT res.Code, res.CheckIn, res.CheckOut, room.Name,
DATEDIFF(res.CheckIn, res.CheckOut) as days
FROM `Reservations` res, `Rooms` room
WHERE res.FirstName = "GLEN"
AND res.LastName = "DONIGAN"
AND res.Room = room.RoomId
ORDER BY res.CheckIn;

--  Q5
SELECT res.Code, room.Name, room.RoomId, res.CheckIn, res.CheckOut
FROM `Reservations` res, `Rooms` room
WHERE res.Room = room.RoomId
AND room.BedType = "Double"
AND res.Adults = 4
ORDER BY res.CheckIn, room.RoomId;