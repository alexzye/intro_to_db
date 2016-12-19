/*
Alex Ye
aye01@calpoly.edu
*/
-- Q1
SELECT Appellation
FROM `appellations`
WHERE County = "Santa Barbara"
ORDER BY Appellation;

-- Q2
SELECT DISTINCT w.Grape, w.Name, w.Score
FROM `appellations` a, `wine` w, `wine` w2
WHERE w.Winery = w2.Winery
AND w2.Grape = "Viognier"
ORDER BY  w.Name ASC, w.Grape;

-- Q3
SELECT w.Winery, w.Name, w.Price, w.Score, w.Cases, 
(20 * ((w.Score - 88)/w.Price) * (1200/w.Cases)) as wineScore
FROM `wine` w
WHERE w.Year = 2008
AND w.Grape = "Grenache"
ORDER BY wineScore DESC;

-- Q4
SELECT DISTINCT w.Year
FROM `wine` w, `appellations` a
WHERE w.Score > 92
AND w.Grape = "Zinfandel"
AND a.County = "Sonoma"
ORDER BY w.Year;

-- Q5
SELECT w.Winery, w.Name, w.Cases * w.Price * 12 as Revenue
FROM `wine` w
WHERE w.Grape = "Cabernet Sauvingnon"
AND w.Score > 96
ORDER BY Revenue DESC;

-- Q6
SELECT w.Price + 2 * (w1.Price) as Total
FROM `wine` w, `wine` w1
WHERE w.Year = 2008
AND w.Grape = "Pinot Noir"
AND w.Winery = "Kosta Browne"
AND w.Name = "Koplen Vineyard"
AND w1.Winery = "Darioush"
AND w1.Year = 2007
AND w1.Grape = "Cabernet Sauvingnon"
AND w1.Name = "Darius II";