/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT Flavor, 
AVG(Price) AS Average, 
COUNT(*) AS Count
FROM `goods`
GROUP BY(Flavor)
HAVING COUNT(*) > 3
ORDER BY Average ASC;

-- Q2
SELECT SUM(g.Price) AS Total
FROM `goods` g, `items` i, `receipts` r
WHERE i.Item = g.Id
AND i.Receipt = r.ReceiptNumber
AND g.Food = "Cake"
AND MONTH(r.Date) = 10
AND YEAR(r.Date) = 2007;

-- Q3
SELECT r.ReceiptNumber, 
c.First, 
COUNT(*) AS Count, 
SUM(g.Price) AS Price
FROM `receipts` r, `customers` c, `goods` g, `items` i
WHERE r.Customer = c.Id
AND r.ReceiptNumber = i.Receipt
AND i.Item = g.Id
AND MONTH(r.Date) = 10
AND DAY(r.Date) = 17
GROUP BY r.ReceiptNumber
ORDER BY Price DESC;

-- Q4
SELECT r.Date, 
DATE_FORMAT(r.Date, "%W") AS DayOfWeek,
COUNT(*) AS Count, 
SUM(g.Price) AS Total
FROM `receipts` r, `items` i, `goods` g
WHERE MONTH(r.Date) = 10
AND r.ReceiptNumber = i.Receipt
AND i.Item = g.Id
GROUP BY(r.Date)
HAVING r.Date BETWEEN "2007-10-8" AND "2007-10-12"
ORDER BY r.Date;