/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT GroupNum, Sex, 
MIN(Place) AS Best, 
MAX(Place) AS Worst 
FROM `marathon`
GROUP BY GroupNum, Sex
HAVING COUNT(*) > 10
ORDER BY GroupNum, Sex;

-- Q2
SELECT DISTINCT COUNT(*) AS Count
FROM `marathon` m, `marathon` m2
WHERE m.GroupNum = m2.GroupNum
AND m.Sex = m2.Sex
AND m.GroupPlace = 1
AND m2.GroupPlace = 2
AND m.State = m2.State;

-- Q3
SELECT MINUTE(Pace) AS Clock, 
COUNT(*) AS Pace
FROM `marathon`
GROUP BY MINUTE(Pace)
ORDER BY Clock;

-- Q4
SELECT State, Sex, COUNT(*) AS Count
FROM `marathon`
WHERE GroupPlace <= 10
GROUP BY State, Sex
HAVING COUNT(*) > 0
ORDER BY Count;

-- Q5
SELECT Town, AVG(TIME_TO_SEC(TIME)) AS Seconds
FROM `marathon`
WHERE State = "MA"
GROUP BY Town
HAVING COUNT(*) >= 6;