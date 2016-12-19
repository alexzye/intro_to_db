/*
Alex Ye
aye01@calpoly.edu
*/
DELETE FROM `discipline-enrollments`
    WHERE (Campus != 7 AND Campus != 20 AND Campus != 9 AND Discipline != 9)
    OR ((Campus = 7 OR Campus = 9) AND Discipline != 22 AND Discipline != 9)
    OR (Campus = 20 AND Discipline != 9 AND (Undergraduate > 500 OR Graduate = 0))
    OR (Discipline = 9 AND Undergraduate < 2000);

SELECT * 
    FROM `discipline-enrollments`
    ORDER BY Campus, Year;


DELETE FROM `csu-fees`
    WHERE CampusFee < 2500
    OR (Year != 2002 AND (Year < 2004 OR Year > 2006))
    OR (Campus != 20 AND Campus != 19 AND Campus != 14);

SELECT *
    FROM `csu-fees`
    ORDER BY Campus, Year;