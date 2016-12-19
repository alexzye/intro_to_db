/*
Alex Ye
aye01@calpoly.edu
*/
-- Q1
SELECT fees.CampusFee
FROM `Campuses` campus, `csu-fees` fees
WHERE campus.Campus = "California Polytechnic State University-San Luis Obispo"
AND campus.Id = fees.Campus
AND fees.Year = 2000;

-- Q2
SELECT enroll.Total, enroll.Year
FROM `enrollments` enroll, `Campuses` campus
WHERE campus.Campus = "California State University-Los Angeles"
AND enroll.Campus = campus.Id
AND enroll.Year >= 1960
AND enroll.Year <= 1969
ORDER BY enroll.Year;

-- Q3
SELECT DISTINCT enroll.FTE, enroll.FTE/faculty.Faculty as Ratio, enroll.Campus
FROM `enrollments` enroll, `faculty` faculty, `Campuses` campus
WHERE campus.Id = enroll.Campus
AND campus.Id = faculty.Campus
AND faculty.Year = enroll.Year
AND enroll.Year = 2003
AND enroll.FTE > 17000
ORDER BY Ratio
DESC;

-- Q4
SELECT c.Campus, d.Name
FROM `discipline-enrollments` de, `disciplines` d, `Campuses` c
WHERE c.Id = de.Campus
AND de.Discipline = d.Id
AND de.Undergraduate <> 0
AND de.Graduate > 3 * de.Undergraduate
AND de.Year = 2004
ORDER BY c.Campus, d.Name;

-- Q5
SELECT f.Year, e.FTE * f.CampusFee as Total, 
f.CampusFee/fa.Faculty as Per_faculty
FROM `csu-fees` f, `Campuses` c, `enrollments` e, `faculty` fa
WHERE c.Id = f.Campus
AND c.Id = f.Campus
AND f.Year = fa.Year
AND e.Year = fa.Year
AND fa.Campus = c.Id
AND f.Campus = c.Id
AND e.Campus = c.Id
AND f.Year >= 2002
AND f.Year <= 2004
AND c.Campus = "Sonoma State University";

-- Q6
SELECT DISTINCT e1.Year, e1.Total, e2.Total + e3.Total as combined_total
FROM `Campuses` c1, `enrollments` e1, `Campuses` c2, 
`enrollments` e2, `Campuses` c3, `enrollments` e3
WHERE c1.Campus = "California Polytechnic State University-San Luis Obispo"
AND c2.Campus = "Sonoma State University"
AND c3.Campus = "California State University-East Bay"
AND c1.Id = e1.Campus
AND c2.Id = e2.Campus
AND c3.Id = e3.Campus
AND e1.Year = e2.Year
AND e2.Year = e3.Year
AND e1.Total > e2.Total + e3.Total;

