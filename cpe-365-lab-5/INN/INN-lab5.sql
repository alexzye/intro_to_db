/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT r.Name, t.Room FROM `Rooms` r, (
(SELECT r.Room
FROM `Reservations` r
WHERE "2010-6-1" BETWEEN r.CheckIn AND r.CheckOut)
UNION ALL
(SELECT r.Room
FROM `Reservations` r
WHERE "2010-8-5" BETWEEN r.CheckIn AND r.CheckOut)
UNION ALL
(SELECT r.Room
FROM `Reservations` r
WHERE "2010-12-1" BETWEEN r.CheckIn AND r.CheckOut)
) AS t 
WHERE r.RoomId = t.Room
GROUP BY Room HAVING COUNT(*) >= 3
ORDER BY r.Name;

-- Q2
SELECT DISTINCT r2.LastName, r2.FirstName
FROM `Reservations` r, `Reservations` r2
WHERE r.FirstName = "Jone"
AND r.LastName = "GOON"
AND (r2.CheckIn BETWEEN r.CheckIn AND r.CheckOut 
OR r2.CheckOut BETWEEN r.CheckIn AND r.CheckOut)
ORDER BY r2.LastName;

-- Q3
SELECT COUNT(*) AS Reservations
FROM `Reservations` r, `Rooms` ro
WHERE (MONTH(r.CheckIn) = 8 OR MONTH(r.CheckIn) = 9)
AND (MONTH(r.CheckOut) = 8 OR MONTH(r.CheckOut) = 9)
AND r.Adults = 1
AND r.Kids = 0
AND r.Room = ro.RoomId
AND ro.Beds = 2;

-- Q4
SELECT MAX(DATEDIFF(r.CheckOut, r.CheckIn)) as Max, 
AVG(DATEDIFF(r.CheckOut, r.CheckIn)) as Avgerage
FROM `Reservations` r, `Rooms` ro
WHERE r.CheckIn BETWEEN "2010-5-1" AND "2010-10-31"
AND r.CheckOut BETWEEN "2010-5-1" AND "2010-10-31"
AND r.Room = ro.RoomId
AND ro.Decor = "modern";

-- Q5
SELECT SUM(DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate + ro.Price) as RND
FROM `Rooms` ro, `Reservations` r
WHERE r.Room = ro.RoomId
AND ro.Name = "Recluse and defiance";

-- Q6
SELECT SUM(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate + r.Price) as Total
FROM `Rooms` r, `Reservations` re
WHERE re.Room = r.RoomId
AND r.Name = "Recluse and defiance";

