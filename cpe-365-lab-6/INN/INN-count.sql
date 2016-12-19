/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT r.Room, 
ro.Price + (DATEDIFF(r.CheckOut, r.CheckIn)) * r.Rate AS Revenue
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
AND MONTH(r.CheckIn) = 5
GROUP BY r.Room
ORDER BY Revenue DESC;

-- Q2
SELECT COUNT(*) AS Count, 
SUM(ro.Price + (DATEDIFF(r.CheckOut, r.CheckIn)) * r.Rate) AS Revenue
FROM `Reservations` r, `Rooms` ro
WHERE DATE_FORMAT(r.CheckIn, "%W") = "Saturday"
AND r.Room = ro.RoomId;

-- Q3
SELECT DATE_FORMAT(r.CheckIn, "%W") AS Day, 
COUNT(*) AS Count,
SUM((DATEDIFF(r.CheckOut, r.CheckIn)) * r.Rate) AS Revenue
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
GROUP BY DATE_FORMAT(r.CheckIn, "%W");

-- Q4
SELECT DATEDIFF(r.CheckOut, r.CheckIn) AS Duration, COUNT(*) AS Days
FROM `Reservations` r, `Rooms` ro
WHERE ro.Name = "Frugal not apropos"
AND r.Room = ro.RoomId
GROUP BY DATEDIFF(r.CheckOut, r.CheckIn)
ORDER BY Duration;

-- Q5