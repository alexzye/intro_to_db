/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT c.Campus, d.Degrees
FROM `enrollments` e, `Campuses` c, `degrees` d
WHERE c.Id = e.Campus
AND e.Campus = d.Campus
AND e.Year = d.Year
GROUP BY e.Campus
HAVING AVG(e.Total) > 20000
ORDER BY c.Campus;

-- Q2
SELECT e.Campus, 
AVG(e.Total) AS Average, 
MAX(e.Total) AS Max, 
MIN(e.Total) AS Min
FROM `enrollments` e
GROUP BY e.Campus
HAVING COUNT(*) > 60
ORDER BY Average;

-- Q3
SELECT d.Year, d.Degrees, f.Faculty
FROM `degrees` d, `faculty` f
WHERE d.Campus = f.Campus
AND d.Year = f.Year
GROUP BY d.Year
ORDER BY d.Year;

-- Q4
SELECT c.Campus, COUNT(*) AS Degrees
FROM `enrollments` e, `discipline-enrollments` d, `Campuses` c
WHERE e.Total > 20000
AND e.Year = 2004
AND d.Year = e.Year
AND d.Campus = e.Campus
AND d.Graduate > 0
AND d.Campus = c.Id
GROUP BY c.Campus
ORDER BY c.Campus;
