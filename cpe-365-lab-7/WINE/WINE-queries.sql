-- Q1
SELECT g.Grape, g.Color, COUNT(DISTINCT Appellation) AS Count 
FROM `wine` w, `grapes` g
WHERE w.Grape = g.Grape
GROUP BY w.Grape
HAVING COUNT(DISTINCT Appellation) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(DISTINCT Appellation) AS ct 
        FROM `wine`
        GROUP BY Grape
    ) a
);

-- Q2
SELECT w.Grape FROM `wine` w, `grapes` g, `appellations` a
WHERE w.Grape = g.Grape
AND w.Appellation = a.Appellation
AND a.County = "Santa Barbara"
AND g.Color = "White"
GROUP BY w.Grape
HAVING COUNT(*) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(*) AS ct FROM `wine` w, `grapes` g, `appellations` a
        WHERE w.Grape = g.Grape
        AND w.Appellation = a.Appellation
        AND a.County = "Santa Barbara"
        AND g.Color = "White"
        GROUP BY w.Grape
    ) a
);

-- Q3
SELECT Grape FROM `wine`
WHERE score >= 93
GROUP BY Grape
HAVING COUNT(*) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(*) AS ct FROM `wine`
        WHERE score >= 93
        GROUP BY Grape
    ) a
);

-- Q4
SELECT Appellation FROM `wine`
WHERE score >= 93
GROUP BY Appellation
HAVING COUNT(*) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(*) AS ct FROM `wine`
        WHERE score >= 93
        GROUP BY Appellation
    ) a
);

-- Q5
SELECT w.Year, w.Winery, w.Name, w.Score, 
w.Cases * 12 * w.Price AS Revenue 
FROM `wine` w
WHERE w.Score >= 93
AND w.Cases * 12 * w.Price >=
(
    SELECT MAX(rev) FROM 
    (
        SELECT w.Cases * 12 * w.Price AS rev FROM `wine` w
        WHERE w.Score >= 93
    ) a
);

-- Q6
SELECT Winery, Name, Appellation, Score, Price FROM `wine`
WHERE Grape = "Zinfandel"
AND Score >
(
    SELECT MAX(Score) FROM `wine`
    WHERE YEAR = 2007
    AND Grape = "Grenache"
);

-- Q7
SELECT Appellation, COUNT(*) AS Count FROM 
(
    SELECT * FROM `wine` w1
    WHERE (w1.Appellation = "Carneros" 
        OR w1.Appellation = "Dry Creek Valley")
    AND w1.Score >=
    (
        SELECT MAX(Score) FROM `wine` w
        WHERE (w.Appellation = "Carneros" 
            OR w.Appellation = "Dry Creek Valley")
        AND w.Year = w1.Year
    )
    GROUP BY w1.Year
    HAVING COUNT(*) = 1
) a
GROUP BY Appellation;

-- Q8
SELECT w.Cases FROM `wine` w, `grapes` g, `appellations` a
WHERE w.Grape = g.Grape
AND w.Appellation = a.Appellation
AND a.County = "Napa"
AND g.Color = "Red"
AND w.Price >=
(
    SELECT MAX(Price) FROM `wine` w, `grapes` g, `appellations` a
    WHERE w.Grape = g.Grape
    AND w.Appellation = a.Appellation
    AND a.County = "Napa"
    AND g.Color = "Red"
);

-- Q9
SELECT DISTINCT w.Year, w.Appellation 
FROM `wine` w
WHERE w.Price >= 
(
    SELECT MAX(Price) FROM `wine` wa
    WHERE wa.Year = w.Year
)
ORDER BY w.Year