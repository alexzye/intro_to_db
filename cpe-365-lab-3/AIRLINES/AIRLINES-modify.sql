/*
Alex Ye
aye01@calpoly.edu
*/

DELETE FROM `flights` 
    WHERE Source != "AOS" 
    AND Dest != "AOS";

UPDATE `flights` 
    SET FlightNo = FlightNo + 2000 
    WHERE Airline != 6 
    AND Airline != 8 
    AND Airline != 12;

ALTER TABLE `flights` 
    ADD NewFlightNo INT;

UPDATE `flights` SET 
    NewFlightNo = CASE 
    WHEN MOD(FlightNo, 2) = 1 
    THEN FlightNo - 1 
    ELSE FlightNo + 1 
    END;

ALTER TABLE `flights` 
    DROP PRIMARY KEY, 
    ADD PRIMARY KEY(Airline, NewFlightNo);

UPDATE `flights` SET
    FlightNo = NewFlightNo;

ALTER TABLE `flights` 
    DROP PRIMARY KEY, 
    ADD PRIMARY KEY(Airline, FlightNo);

ALTER TABLE `flights` 
    DROP COLUMN NewFlightNo;

UPDATE `flights` 
    SET Airline = 6 
    WHERE Airline != 6 
    AND Airline != 8 
    AND Airline != 12;

SELECT *
    FROM `flights`
    ORDER BY Airline, FlightNo;