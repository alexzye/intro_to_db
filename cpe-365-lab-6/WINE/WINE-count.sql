/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT w.Score, 
AVG(w.Price) AS Average, 
MIN(w.Price) AS Cheapest,
MAX(w.Price) AS MostExpensive, 
COUNT(*) AS Total, 
SUM(w.Cases) AS Cases
FROM `wine` w
WHERE w.Score > 88
GROUP BY w.Score
ORDER BY w.Score;

-- Q2
SELECT w.Year, 
COUNT(*) AS Count
FROM `wine` w, `grapes` g, `appellations` a
WHERE w.Grape = g.Grape
AND w.Appellation = a.Appellation
AND g.Color = "white"
AND w.Score > 90
AND a.County = "Santa Barbara"
GROUP BY w.Year
ORDER BY Year;

-- Q3
SELECT w.Appellation, a.County, 
COUNT(*) AS Count, 
AVG(w.Price) AS AveragePrice, 
SUM(12 * w.Cases) AS Bottles
FROM `wine` w, `appellations` a
WHERE w.Grape = "Cabernet Sauvingnon"
AND w.Year = 2007
AND w.Appellation = a.Appellation
GROUP BY w.Appellation
HAVING COUNT(*) > 2
ORDER BY Count;

-- Q4
SELECT w.Appellation, SUM(w.Cases * 12 * w.Price) AS Volume
FROM `wine` w,`appellations` a
WHERE a.Area = "Central Coast"
AND w.Appellation = a.Appellation
AND w.Year = 2008
GROUP BY w.Appellation
ORDER BY Volume DESC;

-- Q5
SELECT a.County, MAX(w.Score) AS Max
FROM `wine` w, `appellations` a, `grapes` g
WHERE w.Appellation = a.Appellation
AND w.Grape = g.Grape
AND g.Color = "Red"
AND w.Year = 2009
AND a.County <> "N/A"
GROUP BY a.County
ORDER BY Max DESC;

