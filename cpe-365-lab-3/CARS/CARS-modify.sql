/*
Alex Ye
aye01@calpoly.edu
*/
DELETE FROM `cars-data` 
    WHERE Mpg IS NULL
    OR Horsepower IS NULL
    OR ((Year != 1979 
    OR (Accelerate >= 14 OR Accelerate <= 13))
    AND (Mpg <= 26 OR Horsepower < 110));

SELECT * FROM `cars-data` ORDER BY Year, Id;

ALTER TABLE `cars-data` 
    DROP COLUMN Weight, 
    DROP COLUMN Edispl;

SELECT * FROM `cars-data` ORDER BY Year, Id;