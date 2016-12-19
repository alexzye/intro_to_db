/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT Flavor, Food, Price 
FROM `goods`
WHERE Food = "Cake"
ORDER BY Price DESC;

-- Q2
SELECT Flavor, Food, Price
FROM `goods`
WHERE (Flavor = "Chocolate"
AND Price >= 1 
AND Price <= 2)
OR Food = "Meringue"
OR (Food = "Eclair" 
AND Flavor != "Vanilla")
ORDER BY Flavor, Food;

-- Q3
SELECT g.Food, g.Flavor, g.Price
FROM `goods` g, `items` i, `receipts` r, `customers` c
WHERE g.Id = i.Item
AND i.Receipt = r.ReceiptNumber
AND r.Date = "2007/10/13"
AND r.Customer = c.Id
AND c.First = "TERRELL"
AND c.Last = "ARZT"
ORDER BY g.Food, g.Flavor;

-- Q4
SELECT g.Flavor, g.Food
FROM `goods` g, `items` i, `receipts` r
WHERE g.Food = "Eclair"
AND g.Id = i.Item
AND i.Receipt = r.ReceiptNumber
AND r.Date = "2007/10/4"
ORDER BY g.Flavor;

-- Q5
SELECT DISTINCT g1.Flavor, g1.Food, g1.Price
FROM `goods` g, `items` i, `receipts` r, `customers` c, `goods` g1
WHERE g1.Price < g.Price
AND g.Id = i.Item
AND i.Receipt = r.ReceiptNumber
AND r.Date = "2007/10/27"
AND r.Customer = c.Id
AND c.First = "RAYFORD"
AND c.Last = "SOPKO"
ORDER BY g1.Price 
DESC;
