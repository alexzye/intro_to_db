

-- Q1
SELECT ro.Name, ro.RoomId, COUNT(*) AS Reservations 
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
GROUP BY r.Room
HAVING COUNT(*) >=
(
    SELECT MAX(ct) 
    FROM 
    (
        SELECT COUNT(*) AS ct FROM `Reservations`
        GROUP BY Room
    ) a
);

-- Q2
SELECT ro.Name, ro.RoomId, SUM(DATEDIFF(r.CheckOut, r.CheckIn)) AS Occupied 
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
GROUP BY r.Room
HAVING SUM(DATEDIFF(r.CheckOut, r.CheckIn)) = 
(
    SELECT MIN(Booked) FROM 
    (
        SELECT SUM(DATEDIFF(CheckOut, CheckIn)) AS Booked 
        FROM `Reservations`
        GROUP BY Room
    ) a
);

-- Q3
SELECT ro.Name, DATEDIFF(r.CheckOut, r.CheckIn) AS Days, r.LastName, r.Rate
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
AND ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate >= 
(
    SELECT MAX(Cost) FROM
    (
        SELECT ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate AS Cost 
        FROM `Reservations` r, `Rooms` ro
        WHERE r.Room = ro.RoomId
    ) a
);

-- Q4
SELECT ro1.Name, DATEDIFF(r1.CheckOut, r1.CheckIn) AS Days, 
r1.LastName, r1.Rate, 
ro1.Price + DATEDIFF(r1.CheckOut, r1.CheckIn) * r1.Rate AS Cost  
FROM `Reservations` r1, `Rooms` ro1
WHERE r1.Room = ro1.RoomId
AND ro1.Price + DATEDIFF(r1.CheckOut, r1.CheckIn) * r1.Rate >=
(
    SELECT MAX(Cost) FROM 
    (
        SELECT ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate AS Cost, 
        r.Room 
        FROM `Reservations` r, `Rooms` ro
        WHERE r.Room = ro.RoomId
    ) a
    WHERE a.Room = r1.Room
)
ORDER BY Cost DESC;

-- Q5
SELECT DATE_FORMAT(r.CheckIn, "%M") AS Mon, 
COUNT(*) AS Reservations, 
SUM(ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate) AS Revenue 
FROM `Reservations` r, `Rooms` ro
WHERE r.Room = ro.RoomId
GROUP BY MONTH(r.CheckIn)
HAVING SUM(ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate) >= 
(
    SELECT MAX(rev) FROM 
    (
        SELECT SUM(ro.Price + DATEDIFF(r.CheckOut, r.CheckIn) * r.Rate) AS rev
        FROM `Reservations` r, `Rooms` ro
        WHERE r.Room = ro.RoomId
        GROUP BY MONTH(CheckIn)
    ) a
);

-- Q6
SELECT ro.Name, ro.RoomId,
CASE 
    WHEN ro.RoomId IN 
    (
        SELECT r.Room FROM `Reservations` r
        WHERE "2010-5-5" BETWEEN r.CheckIn AND r.CheckOut
        AND "2010-5-5" <> r.CheckOut
    ) THEN "Occupied"
    ELSE "Empty"
END AS RoomStatus
FROM `Rooms` ro
ORDER BY RoomId;

-- Q7
SELECT r.Name, COUNT(*) AS Count 
FROM `Reservations` b, `Rooms` r, 
(
    SELECT Room, MAX(Rate) AS Cost 
    FROM `Reservations`
    GROUP BY Room
) a
WHERE a.Room = b.Room
AND a.Cost = b.Rate
AND a.Room = r.RoomId
GROUP BY a.Room
ORDER BY Count ASC;