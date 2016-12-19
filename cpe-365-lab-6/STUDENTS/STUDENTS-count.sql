/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT t.First, t.Last
FROM `list` l, `teachers` t
WHERE l.Classroom = t.Classroom
GROUP BY(t.Classroom)
HAVING COUNT(*) = 4 
OR COUNT(*) = 3
ORDER BY t.Last;

-- Q2
SELECT Grade, 
COUNT(DISTINCT Classroom) AS Classrooms,
COUNT(*) AS Students
FROM `list` l
GROUP BY(Grade)
ORDER BY Classrooms DESC,
Grade ASC;

-- Q3
SELECT Classroom, 
COUNT(*) AS Count
FROM `list`
WHERE Grade = 4
GROUP BY(Classroom)
ORDER BY Count ASC;

-- Q4
SELECT Classroom, MAX(Last) AS Last
FROM `list`
GROUP BY(Classroom)
ORDER BY(Classroom);

-- Q5
SELECT CHAR_LENGTH(Last) AS Characters, 
COUNT(Last) AS Amount
FROM `list`
GROUP BY CHAR_LENGTH(Last)
ORDER BY(Characters) ASC;
