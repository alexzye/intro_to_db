/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT l2.First, l2.Last
FROM `list` l, `list` l2
WHERE l.First = "MEL" AND l.Last = "BALBOA"
AND l.Classroom = l2.Classroom
AND (l.First != l2.First OR l.Last != l2.Last)
ORDER BY l2.Last ASC;

-- Q2
SELECT l.First, l.Last
FROM `list` l, `teachers` t
WHERE t.Last = "MOYER" AND t.First = "OTHA"
AND l.Grade = 1
AND l.Classroom != t.Classroom
ORDER BY l.Last;

-- Q3
SELECT COUNT(DISTINCT l.Grade) as Total
FROM `list` l
WHERE l.Grade = 2;

-- Q4
SELECT l.Last
FROM `list` l, `teachers` t
WHERE t.First = "LEIA"
AND t.Last = "TARRING"
AND t.Classroom = l.Classroom
ORDER BY l.Last ASC
LIMIT 1;