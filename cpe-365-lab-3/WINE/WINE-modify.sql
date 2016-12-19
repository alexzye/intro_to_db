/*
Alex Ye
aye01@calpoly.edu
*/
ALTER TABLE `wine` 
    DROP FOREIGN KEY wine_ibfk_2;

ALTER TABLE `wine` 
    DROP COLUMN Appellation;

DELETE FROM `wine` 
    WHERE Grape != 'Zinfandel' 
    OR Score < 93;

ALTER TABLE `wine` 
    MODIFY Winery VARCHAR(18);

SELECT * FROM `wine` ORDER BY Id;

ALTER TABLE `wine` 
    ADD COLUMN Revenue FLOAT;

UPDATE `wine` 
    SET Revenue=(Cases * 12 * Price);

DELETE FROM `wine` 
    WHERE Revenue < 150000;

SELECT * FROM `wine` ORDER BY Id;