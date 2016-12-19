/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT cm.Short, MAX(cd.Weight) AS Weight, 
AVG(cd.Horsepower) AS Horsepower
FROM `car-makers` cm, `countries` c, 
`cars-data` cd, `car-names` cn,
`model-list` ml
WHERE c.CountryId = cm.Country
AND ml.Maker = cm.Id
AND cn.Model = ml.Model
AND cd.Id = cn.MakeId
GROUP BY cm.Short
ORDER BY cm.Short;

-- Q2
SELECT cm.Short, COUNT(*) AS Count
FROM `car-makers` cm, `countries` c, 
`cars-data` cd, `car-names` cn,
`model-list` ml
WHERE c.Name = "usa"
AND c.CountryId = cm.Country
AND ml.Maker = cm.Id
AND cn.Model = ml.Model
AND cd.Id = cn.MakeId
AND cd.Cylinders = 4
AND cd.Weight < 4000
AND cd.Accelerate < 14
GROUP BY cm.Short
ORDER BY Count;

-- Q3
SELECT cd.Year
FROM `cars-data` cd, `car-names` cn,
`car-makers` cm, `model-list` ml
WHERE cd.Id = cn.MakeId
AND cn.Model = ml.Model
AND ml.Maker = cm.Id
AND (cm.Short = "honda" OR cm.Short = "toyota")
GROUP BY cd.Year, cm.Short
HAVING COUNT(cm.Short = "toyota") > 2
ORDER BY cd.Year;

-- Q4
SELECT cd.Year, MAX(cd.Edispl) AS Highest, MIN(cd.Edispl) AS Lowest
FROM `car-makers` cm, `countries` c, 
`cars-data` cd, `car-names` cn,
`model-list` ml
WHERE c.Name = "usa"
AND c.CountryId = cm.Country
AND ml.Maker = cm.Id
AND cn.Model = ml.Model
AND cd.Id = cn.MakeId
GROUP BY cd.Year
HAVING AVG(cd.Horsepower) < 100
ORDER BY Year;

-- Q5
SELECT cd.Year, 
AVG(cd.Weight/cd.Horsepower * cd.Accelerate) AS Q
FROM `car-makers` cm, `countries` c, 
`cars-data` cd, `car-names` cn,
`model-list` ml
WHERE c.Name = "usa"
AND c.CountryId = cm.Country
AND ml.Maker = cm.Id
AND cn.Model = ml.Model
AND cd.Id = cn.MakeId
GROUP BY cd.Year
ORDER BY cd.Year;