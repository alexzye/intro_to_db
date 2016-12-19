/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT f.Source AS Code, a.Name
FROM `flights` f, `airports100` a
WHERE a.Code = f.Source
GROUP BY f.Source
HAVING COUNT(*) < 5
ORDER BY f.Source;

-- Q2
SELECT COUNT(*) AS Count
FROM `flights` f, `flights` f2
WHERE f.Airline = f2.Airline
AND f.Dest = f2.Source
AND f2.Dest = "ANP"
AND f.Source <> "ANP";

-- Q3


-- Q4
SELECT f.Source, COUNT(*) AS Count
FROM `airlines` a, `flights` f
WHERE a.Id = f.Airline
GROUP BY f.Source
ORDER BY Count DESC;