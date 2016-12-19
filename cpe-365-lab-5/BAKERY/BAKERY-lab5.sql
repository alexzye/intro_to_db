/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT DISTINCT c.First, c.Last
FROM `receipts` r, `receipts` r2, `customers` c
WHERE r.Date BETWEEN '2007-10-5' AND '2007-10-11'
AND r2.Date BETWEEN '2007-10-5' AND '2007-10-11'
AND r.Customer = c.Id
AND r.Customer = r2.Customer
AND r.ReceiptNumber != r2.ReceiptNumber
AND r.Date = r2.Date;

-- Q2
SELECT DISTINCT c.First, c.Last
FROM `items` i, `items` i2, `goods` g, `customers` c, `receipts` r
WHERE i2.Receipt = i.Receipt
AND i.Item = i2.Item
AND i.Ordinal > i2.Ordinal
AND i.Item = g.Id
AND g.Food = "Cookie"
AND i.Receipt = r.ReceiptNumber
AND r.Customer = c.Id;

-- Q3
SELECT DISTINCT g.Food, g.Flavor, g.Price
FROM `items` i, `items` i2, `items` i3, `customers` c, 
`receipts` r, `receipts` r2, `receipts` r3, `goods` g
WHERE i.Item = i2.Item
AND i2.Item = i3.Item
AND i2.Ordinal != i.Ordinal
AND i.Ordinal != i3.Ordinal
AND i2.Ordinal != i3.Ordinal
AND i.Receipt > i2.Receipt
AND i2.Receipt > i3.Receipt
AND i.Receipt = r.ReceiptNumber
AND i2.Receipt = r2.ReceiptNumber
AND i2.Receipt = r3.ReceiptNumber
AND r.Customer = c.Id
AND r2.Customer = c.Id
AND r3.Customer = c.Id
AND c.First = "STEPHEN"
AND c.Last = "ZEME"
AND i.Item = g.Id
ORDER BY g.Price;

-- Q4
(SELECT r.Date
FROM `goods` g, `items` i, `receipts` r
WHERE g.Flavor = "Gongolais"
AND g.Food = "Cookie"
AND i.Item = g.Id
AND i.Receipt = r.ReceiptNumber
)
UNION
(SELECT r.Date
FROM `items` i, `customers` c, `receipts` r
WHERE c.First = "RUPERT"
AND c.Last = "HELING"
AND c.Id = r.Customer
AND i.Receipt = r.ReceiptNumber
) 
ORDER BY Date;

-- Q5
SELECT DISTINCT SUM(g.Price) AS Total
FROM `customers` c, `receipts` r, `items` i, `goods` g
WHERE c.First = "RAYFORD"
AND c.Last = "SOPKO"
AND r.Customer = c.Id
AND MONTH(r.Date) = 10
AND r.ReceiptNumber = i.Receipt
AND i.Item = g.Id;

-- Q6
SELECT SUM(g.Price) AS Total
FROM `goods` g, `items` i, `receipts` r
WHERE (g.Flavor = "Lemon" OR g.Flavor = "Cherry")
AND g.Food = "Tart"
AND g.Id = i.Item
AND i.Receipt = r.ReceiptNumber
AND YEAR(r.Date) = 2007
AND MONTH(r.Date) = 10;

-- Q7
SELECT DISTINCT SUM(ordinal) AS Total
FROM `items` i
GROUP BY Receipt
HAVING COUNT(Receipt) = 5;