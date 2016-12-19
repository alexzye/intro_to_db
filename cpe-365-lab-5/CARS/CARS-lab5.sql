/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT n2.Description, cd.Year, n2.Model
FROM `cars-data` cd, `cars-data` cd2, `car-names` n, `car-names` n2
WHERE cd.Year = 1978
AND n.MakeId = cd2.Id
AND n.Description = "honda civic"
AND cd2.Year = 1982 
AND cd.Mpg > cd2.Mpg
AND n2.MakeId = cd.Id
ORDER BY cd.Mpg DESC;

-- Q2
SELECT AVG(cd.Accelerate) AS Average, 
MAX(cd.Accelerate) AS Max, 
MIN(cd.Accelerate) AS Min
FROM `cars-data` cd, `car-makers` cm, `car-names` cn, `countries` c, `model-list` ml
WHERE cd.Year >= 1971 AND cd.Year <= 1976
AND cd.Cylinders = 8
AND cd.Id = cn.MakeId
AND cn.Model = ml.Model
AND ml.Maker = cm.Id
AND cm.Country = c.CountryId
AND c.Name = "usa";

-- Q3
SELECT COUNT(cd2.Id) AS Total
FROM `cars-data` cd, `car-names` cn, `cars-data` cd2
WHERE cn.Description = "fiat strada custom"
AND cn.MakeId = cd.Id
AND cd.Year = 1979
AND cd2.Year = 1973
AND cd2.Accelerate > cd.Accelerate;

-- Q4
SELECT COUNT(DISTINCT cm.Short) as Manufacturers
FROM `cars-data` cd, `car-names` cn, `car-makers` cm, `model-list` ml
WHERE cd.Weight > 4000
AND cd.Id = cn.MakeId
AND cn.Model = ml.Model
AND ml.Maker = cm.Id;

-- Q5
SELECT cd.Year, AVG(cd.Weight / cd.Horsepower) as WeightToHP
FROM `cars-data` cd
WHERE cd.Year = 1970 
OR cd.Year = 1971
GROUP BY(cd.Year)
ORDER BY WeightToHP;