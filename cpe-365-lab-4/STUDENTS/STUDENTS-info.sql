/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT Last, First 
FROM `list`
WHERE Classroom = 102
ORDER BY Last;

-- Q2
SELECT DISTINCT Grade, Classroom 
FROM `list`
ORDER BY Grade;

-- Q3
SELECT l.Last, l.First 
FROM `list` l, `teachers` t
WHERE l.Classroom = t.Classroom
AND t.First = "BILLIE" 
AND t.Last = "KRIENER"
ORDER BY l.Last;

-- Q4
SELECT l1.Last, l1.First, l2.Last, l2.First
FROM `list` l1, `list` l2
WHERE l1.First = l2.First
AND l1.Last != l2.Last
AND l1.Last > l2.Last;

-- Q5
SELECT DISTINCT l.Grade, t.Last, t.First
FROM `list` l, `teachers` t
WHERE t.Classroom = l.Classroom
AND l.Grade >= 3
AND l.Grade <= 6
ORDER BY l.Grade, t.Last;