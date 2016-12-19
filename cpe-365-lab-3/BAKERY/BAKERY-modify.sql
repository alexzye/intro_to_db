/*
Alex Ye
aye01@calpoly.edu
*/
ALTER TABLE `items` 
    DROP FOREIGN KEY items_ibfk_2;

DELETE FROM `goods`
    WHERE Food != "Cake";

UPDATE `goods` SET
    Price = Price * 1.20
    WHERE Flavor = "Opera"
    OR Flavor = "Chocolate";

UPDATE `goods` SET
    Price = Price - 2
    WHERE Flavor = "Lemon"
    OR Flavor = "Napoleon";

UPDATE `goods` SET
    Price = Price * .9
    WHERE Flavor != "Opera"
    AND Flavor != "Chocolate"
    AND Flavor != "Lemon"
    AND Flavor != "Napoleon";

SELECT *
    FROM `goods`
    ORDER BY Id;