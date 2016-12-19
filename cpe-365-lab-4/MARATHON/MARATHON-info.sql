/*
Alex Ye
aye01@calpoly.edu
*/
-- Q1
SELECT Place
FROM `marathon` 
WHERE GroupPlace = 2
AND GroupNum = "50-59"
AND Sex = "M";

-- Q2
SELECT First, Last, Time, Place, GroupPlace
FROM `marathon`
WHERE Sex = "M"
AND Town = "CAMBRIDGE"
AND State = "MA"
ORDER BY Place;

-- Q3
SELECT m.First, m.Last, m.GroupNum, m.Place, m.GroupPlace, m.Town
FROM `marathon` m, `marathon` m2
WHERE m.Sex = "F"
AND m2.GroupPlace = 50
AND m2.GroupNum = "40-49"
AND m.Place < m2.Place;

-- Q4
SELECT DISTINCT m.Bib
FROM `marathon` m, `marathon` m2
WHERE m.Place != m2.Place
AND m.Bib = m2.Bib
ORDER BY m.Bib
ASC;

-- Q5
SELECT m1.First as WinnerFirst, m1.Last as WinnerLast, 
m1.Age, m2.First as RunnerUpFirst, m2.Last as RunnerUpLast, m2.Age
FROM `marathon` m1, `marathon` m2
WHERE m1.GroupPlace = 1
AND m2.GroupPlace = 2
AND m1.GroupNum = m2.GroupNum
AND m1.Sex = m2.Sex
ORDER BY m1.Sex, m2.Sex, m1.GroupNum, m2.GroupNum;