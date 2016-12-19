
-- Q1
SELECT w.Grape, w.Winery, w.Name, w.Score, w.Cases * w.Price * 12 as Revenue
FROM `wine` w, `appellations` a, `wine` w2
WHERE w.Year = 2006
AND w.Appellation = a.Appellation
AND a.County = "Napa"
AND w2.Year = 2006
AND w2.Grape = "Zinfandel"
AND w2.Name = "Appelation Series"
AND w2.Appellation = "Paso Robles"
AND w2.Winery = "Rosenblum"
AND w.Cases * w.Price * 12 > w2.Cases * w2.Price * 12
ORDER BY Revenue;

-- Q2
SELECT w2.Name, w2.Grape
FROM `wine` w, `wine` w2
WHERE w.Winery = "Tor"
AND w.Grape = "Chardonnay"
AND w2.Year = w.Year
AND w2.score > w.score
AND w2.Cases > w.Cases;

-- Q3
SELECT AVG(w.Score) AS Average
FROM `wine` w, `appellations` a
WHERE w.Appellation = a.Appellation
AND a.County = "Sonoma";

-- Q4
SELECT g.Color, w.Cases * 12 * w.Price as Revenue
FROM `wine` w, `grapes` g, `appellations` a
WHERE w.Grape = g.Grape
AND w.Appellation = a.Appellation
AND a.County = "Santa Barbara"
AND (g.Color = "Red" OR g.Color = "White")
AND w.Year = 2008
GROUP BY g.Color;

-- Q5
SELECT AVG(w.Cases) AS Average
FROM `wine` w, `appellations` a
WHERE w.Grape = "Pinot Noir"
AND w.Appellation = a.Appellation
AND a.Area = "Central Coast";

-- Q6
SELECT COUNT(*) AS Total
FROM `wine` w, `grapes` g, `wine` w2
WHERE w.Grape = g.Grape
AND w.Appellation = "Russian River Valley"
AND g.Color = "Red"
AND w2.Appellation = "Russian River Valley"
AND w2.Score = 98
AND w.Year = w2.Year;

-- Q7
SELECT COUNT(w.Cases * 12 * w.Price > w2.Cases * 12 * w2.Price) as Total
FROM `wine` w, `wine` w2
WHERE w.Grape = "Zinfandel"
AND w2.Grape = "Grenache"
AND w2.Score = 97;
