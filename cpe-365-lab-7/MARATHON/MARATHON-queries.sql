-- Q1
SELECT State FROM `marathon`
GROUP BY State
HAVING COUNT(*) >=
(
    SELECT MAX(state) FROM 
    (
        SELECT COUNT(*) AS state FROM `marathon`
        GROUP BY State
    ) a
);

-- Q2
SELECT DISTINCT m.Town FROM `marathon` m
WHERE m.State = "RI"
AND 
(
    SELECT COUNT(*) 
    FROM `marathon` 
    WHERE town = m.Town 
    AND sex = "F"
)
> 
(
    SELECT COUNT(*) 
    FROM `marathon` 
    WHERE town = m.Town 
    AND sex = "M"
);

-- Q3
SELECT m.First, m.Last, m.Town, m.State, m.Place 
FROM `marathon` m
WHERE m.State = "RI"
AND m.Town = "WARWICK"
AND m.Time < 
(
    SELECT MAX(TIME) FROM `marathon`
    WHERE State = "MO"
);

-- Q4
SELECT DISTINCT m.State, m.GroupNum, COUNT(*) AS Count
FROM `marathon` m
GROUP BY State, GroupNum, Sex
HAVING COUNT(*) >=
(
    SELECT MAX(l) FROM
    (
        SELECT *, COUNT(*) AS l FROM `marathon`
        GROUP BY State, GroupNum, Sex
        HAVING COUNT(*) > 1
    ) a
    WHERE a.State = m.State
)
ORDER BY State;


-- Q5
SELECT m.Place, m.First, m.Last 
FROM `marathon` m
WHERE m.Sex = "F"
AND m.Time = 
(
    SELECT MAX(TIME) FROM 
    (
        SELECT * FROM `marathon` m
        WHERE m.Sex = "F"
        LIMIT 30
    ) a
);