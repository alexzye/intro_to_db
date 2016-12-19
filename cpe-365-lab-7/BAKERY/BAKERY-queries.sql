/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT c.First, c.Last
FROM `customers` c, `receipts` r, `items` i, `goods` g
WHERE c.Id = r.Customer
AND r.ReceiptNumber = i.Receipt
AND i.Item = g.Id
GROUP BY c.Id
HAVING SUM(g.Price) >=
(
    SELECT MAX(l) FROM (
        SELECT SUM(g.Price) AS l 
        FROM `receipts` r, `items` i, `goods` g
        WHERE MONTH(r.Date) = 10
        AND YEAR(r.Date) = 2007
        AND r.ReceiptNumber = i.Receipt
        AND i.Item = g.Id
        GROUP BY r.Customer
    ) a
);

-- Q2
SELECT c.First, c.Last 
FROM `customers` c
WHERE c.Id NOT IN (
    SELECT DISTINCT c.Id
    FROM `items` i, `goods` g, 
    `receipts` r, `customers` c
    WHERE c.Id = r.Customer
    AND r.ReceiptNumber = i.Receipt
    AND i.Item = g.Id
    AND MONTH(r.Date) = 10
    AND YEAR(r.Date) = 2007
    AND g.Food  = "Twist"
)
ORDER BY c.Last;

-- Q3
SELECT Food, Flavor FROM `goods` g, `items` i
WHERE i.Item = g.Id
GROUP BY g.Id
HAVING SUM(g.Price) >=
(
    SELECT MAX(Total) FROM 
    (
        SELECT SUM(Price) total FROM
        `goods` g, `items` i
        WHERE i.Item = g.Id
        GROUP BY g.Id
    ) a
);

-- Q4
SELECT g.Food, g.Flavor
FROM `items` i, `goods` g
WHERE i.Item = g.Id
GROUP BY i.Item
HAVING COUNT(*) >=
(
    SELECT MAX(count) FROM 
    (
        SELECT COUNT(*) count
        FROM `items` i, `goods` g
        WHERE i.Item = g.Id
        GROUP BY i.Item
    ) a
);

-- Q5
SELECT r.Date AS LeastRev
FROM `receipts` r, `items` i, `goods` g
WHERE r.ReceiptNumber = i.Receipt
AND i.Item = g.Id
GROUP BY r.Date
HAVING SUM(g.Price) <=
(
    SELECT MIN(revenue) FROM 
    (
        SELECT SUM(Price) AS revenue
        FROM `receipts` r, `items` i, `goods` g
        WHERE r.ReceiptNumber = i.Receipt
        AND MONTH(r.Date) = 10
        AND YEAR(r.Date) = 2007
        AND i.Item = g.Id
        GROUP BY r.Date
    ) a
);

-- Q6
SELECT c.First, c.Last, COUNT(*) AS Count, MAX(r.Date) 
FROM `customers` c, `receipts` r
WHERE c.Id = r.Customer
AND c.Id NOT IN 
(
    SELECT DISTINCT c.Id
    FROM `customers` c, `receipts` r
    WHERE c.Id = r.Customer
    AND r.Date = 
    (
        SELECT r.Date
        FROM `receipts` r, `items` i, `goods` g
        WHERE r.ReceiptNumber = i.Receipt
        AND i.Item = g.Id
        GROUP BY r.Date
        HAVING SUM(g.Price) >=
        (
            SELECT MAX(total) FROM 
            (
                SELECT SUM(g.Price) AS total
                FROM `receipts` r, `items` i, `goods` g
                WHERE r.ReceiptNumber = i.Receipt
                AND i.Item = g.Id
                GROUP BY r.Date
            ) a
        )
    )
)
GROUP BY c.Id
ORDER BY Count;

-- Q7


-- Q8
SELECT g.Id, g.First, g.Last FROM `customers` g 
WHERE g.Id NOT IN
(
    SELECT DISTINCT r.Customer
    FROM `receipts` r
    WHERE r.Date BETWEEN "2007-10-5" AND "2007-10-11"
)
ORDER BY g.Last;

-- Q9
SELECT c2.First, c2.Last, MIN(r5.Date) AS FirstDay 
FROM `receipts` r5, `customers` c2,
(
    SELECT r4.Customer FROM `receipts` r3,
    (
        SELECT r2.Date, r2.Customer FROM `receipts` r2
        WHERE r2.date = 
        (
            SELECT MAX(r.Date) FROM `receipts` r
            WHERE r.Customer = r2.Customer
        )
    ) r4
    WHERE r3.Customer = r4.Customer
    AND r3.Date = r4.Date
    GROUP BY r4.Customer
    HAVING COUNT(*) > 1
) r6
WHERE r5.Customer = r6.Customer
AND r5.Customer = c2.Id
GROUP BY r5.Customer
ORDER BY c2.First, c2.Last;

-- Q10 
-- All cakes were purchased on a Wednesday
SELECT g2.Flavor, g2.Food 
FROM `items` i2, `goods` g2
WHERE i2.Item = g2.Id
AND g2.Food = "Cake"
AND i2.Item NOT IN 
( 
    SELECT i.Item 
    FROM `items` i, `goods` g, `receipts` r
    WHERE r.ReceiptNumber = i.Receipt
    AND i.Item = g.Id
    AND g.Food = "Cake"
    AND DATE_FORMAT(r.Date, "%W") = "Wednesday"
)
ORDER BY g2.Flavor, g2.Food;
