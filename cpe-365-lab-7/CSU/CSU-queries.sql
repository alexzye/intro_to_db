

-- Q1
SELECT p.Campus, e.Total FROM `enrollments` e, `Campuses` p
WHERE e.Total >= 
(
    SELECT MAX(Total) FROM `enrollments`
    WHERE YEAR = 1965
)
AND e.Year = 1965
AND e.Campus = p.Id;

-- Q2
SELECT co.Campus, SUM(dr.Degrees) AS Degrees
FROM `degrees` dr, `Campuses` co
WHERE dr.Campus = co.Id
GROUP BY dr.Campus
HAVING SUM(dr.Degrees) >=
(
    SELECT max(d) FROM 
    (
        SELECT SUM(Degrees) AS d FROM `degrees`
        GROUP BY Campus
    ) a
);

-- Q3
SELECT co.Campus, e.FTE/f.Faculty AS SFR
FROM `enrollments` e, `faculty` f, `Campuses` co
WHERE e.Campus = f.Campus
AND e.Campus = co.Id
AND e.Year = 2003
AND f.Year = 2003
AND e.Total/f.Faculty <=
(
    SELECT MIN(sfr) FROM 
    (
        SELECT e.FTE/f.Faculty AS sfr FROM `enrollments` e, `faculty` f
        WHERE e.Campus = f.Campus
        AND e.Year = 2003
        AND f.Year = 2003
    ) a
);

-- Q4
SELECT co.Campus, de.Undergraduate/e.Total AS Ratio FROM 
`discipline-enrollments` de, `disciplines` d, `enrollments` e, `Campuses` co
WHERE de.Campus = e.Campus
AND de.Campus = co.Id
AND de.Year = 2004
AND e.Year = 2004
AND d.Id = de.Discipline
AND d.Name = "Social Sciences"
AND de.Undergraduate/e.Total >=
(
    SELECT MAX(ratio) FROM 
    (
        SELECT de.Undergraduate/e.Total AS ratio 
        FROM `discipline-enrollments` de, `disciplines` d, `enrollments` e
        WHERE de.Campus = e.Campus
        AND de.Year = 2004
        AND e.Year = 2004
        AND d.Id = de.Discipline
        AND d.Name = "Social Sciences"
    ) a
);

-- Q5



-- Q6
SELECT d1.Year, co.Campus, d1.Degrees/e1.Total AS Ratio
FROM `degrees` d1, `enrollments` e1, `Campuses` co
WHERE d1.Campus = e1.Campus
AND d1.Campus = co.Id
AND d1.Year BETWEEN 1997 AND 2003
AND d1.Year = e1.Year
AND d1.Degrees/e1.Total >= 
(
    SELECT MAX(Ratio) FROM
    (
        SELECT d.Degrees/e.Total AS Ratio, d.Year AS y 
        FROM `degrees` d, `enrollments` e
        WHERE d.Campus = e.Campus
        AND d.Year = e.Year
    ) a
    WHERE a.y = d1.Year
) ORDER BY Year;

-- Q7
SELECT co.Campus, e1.Year, e1.FTE/f1.Faculty AS SFR
FROM `enrollments` e1, `faculty` f1, `Campuses` co
WHERE e1.Campus = f1.Campus
AND co.Id = e1.Campus
AND e1.Year = f1.Year
AND e1.FTE/f1.Faculty <=
(
    SELECT MIN(SFR) FROM 
    (
        SELECT e.Year, e.Campus, e.FTE/f.Faculty AS SFR
        FROM `enrollments` e, `faculty` f
        WHERE e.Campus = f.Campus
        AND e.Year = f.Year
    ) a
    WHERE a.Campus = e1.Campus
)
ORDER BY Campus;

-- Q8
SELECT co2.Campus
FROM `enrollments` e2, `faculty` f2, `Campuses` co2
WHERE e2.Campus = f2.Campus
AND co2.Id = e2.Campus
AND e2.Year = f2.Year
AND e2.FTE/f2.Faculty =
(
    SELECT MIN(SFR) FROM (
        SELECT co.Campus, e1.Year, e1.FTE/f1.Faculty AS SFR
        FROM `enrollments` e1, `faculty` f1, `Campuses` co
        WHERE e1.Campus = f1.Campus
        AND co.Id = e1.Campus
        AND e1.Year = f1.Year
        AND e1.FTE/f1.Faculty <=
        (
            SELECT MIN(SFR) FROM 
            (
                SELECT e.Year, e.Campus, e.FTE/f.Faculty AS SFR
                FROM `enrollments` e, `faculty` f
                WHERE e.Campus = f.Campus
                AND e.Year = f.Year
            ) a
            WHERE a.Campus = e1.Campus
        )
    ) a
);


