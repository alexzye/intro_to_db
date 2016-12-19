
-- Q1
SELECT cn.Model, cn.Description, cd.Year
FROM `cars-data` cd, `car-names` cn
WHERE cd.Id = cn.MakeId
AND cd.Mpg >= 
(
    SELECT MAX(Mpg) 
    FROM `cars-data`
);

-- Q2
SELECT cn.Model, cn.Description, cd.Year
FROM `cars-data` cd, `car-names` cn
WHERE cd.Id = cn.MakeId
AND cd.Accelerate <= 
(
    SELECT MIN(Accelerate) 
    FROM `cars-data`
)
AND cd.Weight >=
(
    SELECT MAX(cd.Weight)
    FROM `cars-data` cd, `car-names` cn
    WHERE cd.Id = cn.MakeId
    AND cd.Accelerate <= 
    (
        SELECT MIN(Accelerate) 
        FROM `cars-data`
    )
);

-- Q3
SELECT cm1.Country, co.Name, cm1.Short 
FROM `cars-data` cd1, `car-names` cn1, 
`model-list` ml1, `car-makers` cm1, `countries` co
WHERE cd1.Id = cn1.MakeId
AND cm1.Country = co.CountryId
AND cn1.Model = ml1.Model
AND ml1.Maker = cm1.Id
GROUP BY ml1.Maker
HAVING COUNT(*) >= 
(
    SELECT MAX(ct) FROM
    (
        SELECT COUNT(*) AS ct, Country
        FROM `cars-data` cd, `car-names` cn, 
        `model-list` ml, `car-makers` cm
        WHERE cd.Id = cn.MakeId
        AND cn.Model = ml.Model
        AND ml.Maker = cm.Id
        GROUP BY ml.Maker
    ) a      
    WHERE cm1.Country = a.Country
)
ORDER BY co.Name;

-- Q4
SELECT cd.Year, cm.Name, COUNT(*) AS Count, 
AVG(cd.Accelerate) AS AvgAcc
FROM `cars-data` cd, `car-names` cn, 
`model-list` ml, `car-makers` cm
WHERE cd.Id = cn.MakeId
AND cn.Model = ml.Model
AND ml.Maker = cm.Id
GROUP BY cd.Year, cm.Id
HAVING AVG(cd.Accelerate) <= 
(
    SELECT MIN(av) FROM 
    (
        (
            SELECT cd1.Year, AVG(cd1.Accelerate) AS av
            FROM `cars-data` cd1, `car-names` cn1, 
            `model-list` ml1, `car-makers` cm1
            WHERE cd1.Id = cn1.MakeId
            AND cn1.Model = ml1.Model
            AND ml1.Maker = cm1.Id
            GROUP BY cd1.Year, cm1.Id
        )

    ) a
    WHERE a.Year = cd.Year
)
ORDER BY cd.Year;

-- Q5
SELECT cn.Model, cn.Description, cd.Year, co.Name 
FROM `cars-data` cd, `car-names` cn, 
`model-list` ml, `car-makers` cm, `countries` co
WHERE cd.Id = cn.MakeId
AND ml.Maker = cm.Id
AND cm.Country = co.CountryId
AND cn.Model = ml.Model
AND cd.Cylinders = 8
AND cd.Mpg >= 
(
    SELECT MAX(Mpg)
    FROM `cars-data`
    WHERE Cylinders = 8
);

-- Q6
SELECT a.eight - b.four AS Diff FROM 
(
    SELECT MAX(Mpg) AS eight
    FROM `cars-data`
    WHERE Cylinders = 8
) a,
(
    SELECT MIN(Mpg) AS four
    FROM `cars-data`
    WHERE Cylinders = 4
) b;

-- Q7
SELECT co.Name, cn1.Description, cd1.Year, cd1.Weight
FROM `cars-data` cd1, `car-names` cn1, 
`model-list` ml1, `car-makers` cm1, `countries` co
WHERE cd1.Id = cn1.MakeId
AND ml1.Maker = cm1.Id
AND cn1.Model = ml1.Model
AND cm1.Country = co.CountryId
AND cd1.Weight >=
(
    SELECT MAX(cd.Weight)
    FROM `cars-data` cd, `car-names` cn, `model-list` ml, `car-makers` cm
    WHERE cd.Id = cn.MakeId
    AND ml.Maker = cm.Id
    AND cn.Model = ml.Model
    AND cd.Accelerate <= 
    (
        SELECT Accelerate FROM `cars-data`
        WHERE Cylinders = 8
        AND Mpg >=
        (
            SELECT MAX(Mpg) FROM `cars-data`
            WHERE Cylinders = 8
        )
    ) 
    AND cm.Country = cm1.Country
)
AND cd1.Accelerate <= 
(
    SELECT Accelerate FROM `cars-data`
    WHERE Cylinders = 8
    AND Mpg >=
    (
        SELECT MAX(Mpg) FROM `cars-data`
        WHERE Cylinders = 8
    )
);

