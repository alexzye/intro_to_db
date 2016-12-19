/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT l.Grade, COUNT(*) AS Count
FROM `list` l
GROUP BY l.Classroom
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)
    FROM `list`
    GROUP BY Classroom
);

-- Q2
SELECT l.Grade, COUNT(*) AS Count
FROM `list` l
WHERE l.Last LIKE "L%"
GROUP BY l.Grade
HAVING Count >= ALL(
    SELECT COUNT(*)
    FROM `list`
    WHERE `Last` LIKE "L%" 
    GROUP BY Grade
);


-- Q3
SELECT t.First, t.Last, COUNT(*) AS Count, l.Classroom
FROM `list` l, `teachers` t
WHERE t.`Classroom` = l.Classroom
GROUP BY l.Classroom
HAVING Count <= (
SELECT MIN(ct) FROM (SELECT COUNT(*) AS ct
    FROM `list` l
    GROUP BY l.Classroom) a
);

-- Q4
SELECT COUNT(*) AS Count
FROM(
    SELECT *
    FROM `list` l
    GROUP BY l.Classroom
    HAVING COUNT(*) < (
        SELECT COUNT(*)/count(DISTINCT Classroom)
        FROM `list`
    )
) Average;

-- Q5
SELECT Grade, COUNT(*) AS Count
FROM `list`
GROUP BY Grade
HAVING Count < (
    SELECT MAX(numbers) FROM (
        SELECT COUNT(*) AS numbers
        FROM `list`
        GROUP BY Grade
    ) AS Grade
);


-- Q6
SELECT * FROM 
(
    SELECT Classroom, COUNT(*) AS Count
    FROM `list`
    GROUP BY Classroom
) p1, 
(
    SELECT Classroom, COUNT(*) AS Count
    FROM `list`
    GROUP BY Classroom
) p2
WHERE p1.Classroom < p2.Classroom
AND p1.Count = p2.Count
ORDER BY p1.Count ASC;

-- Q7
SELECT l1.Grade, t.Last, t.Classroom FROM 
(
    SELECT l.Grade
    FROM `list` l
    GROUP BY l.Grade 
    HAVING COUNT(DISTINCT l.Classroom) > 1
) a, `list` l1, `teachers` t
WHERE l1.Grade = a.Grade
AND l1.Classroom = t.Classroom
GROUP BY l1.Classroom
HAVING COUNT(*) >= ALL
(
    SELECT COUNT(*) FROM
    `list` l2
    WHERE l2.Grade = l1.Grade
    GROUP BY l2.Classroom
)
ORDER BY l1.Grade ASC;