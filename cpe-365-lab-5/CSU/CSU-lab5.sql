/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT SUM(d.Degrees) as Degrees
FROM `Campuses` c, `degrees` d
WHERE c.Campus = "California Polytechnic State University-San Luis Obispo"
AND d.Campus = c.Id
AND d.Year >= 1995
AND d.Year <= 2000;

-- Q2
SELECT MAX(c.CampusFee) AS Max, 
MIN(c.CampusFee) AS Min, 
AVG(c.CampusFee) as Average
FROM `csu-fees` c
WHERE c.Year = 2005;

-- Q3
SELECT AVG(FTE/Faculty) AS AverageSFR
FROM `enrollments` e, `faculty` f
WHERE e.Year = 2004
AND e.FTE > 15000
AND f.Year = e.Year
AND f.Campus = e.Campus;

-- Q4
SELECT DISTINCT e.Year
FROM `Campuses` c, `enrollments` e, `degrees` d
WHERE c.Campus = "California Polytechnic State University-San Luis Obispo"
AND c.Id = e.Campus
AND d.Campus = c.Id
AND e.Year = d.Year
AND (e.Total > 17000 OR d.Degrees > 3500)
ORDER BY e.Year ASC;

-- Q5
SELECT SUM(Graduate * CampusFee) TotalFees
FROM `discipline-enrollments` de, `csu-fees` cf
WHERE de.Year = 2004
AND cf.Year = 2004
AND cf.Campus = de.Campus;

-- Q6
SELECT ABS(AVG(e.Total - e1.Total)) AS EnrolledDiff,
ABS(AVG(e.FTE - e1.FTE)) AS FTEDiff,
ABS(AVG(d.Degrees - d1.Degrees)) AS DegreeDiff
FROM `enrollments` e, `enrollments` e1, `degrees` d, `degrees` d1,
`Campuses` c, `Campuses` c1
WHERE c.Campus = "California Polytechnic State University-San Luis Obispo"
AND c1.Campus = "California State Polytechnic University-Pomona"
AND e.Campus = c.Id
AND e1.Campus = c1.Id
AND e.Year = e1.Year
AND e.Campus = d.Campus
AND e1.Campus = d1.Campus
AND e.Year = d.Year
AND e1.Year = d1.Year;