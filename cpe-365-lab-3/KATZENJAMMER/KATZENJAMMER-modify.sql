/*
Alex Ye
aye01@calpoly.edu
*/
UPDATE `Instruments`
    SET Instrument = "awesome bass balalaika"
    WHERE Instrument = "bass balalaika";

UPDATE `Instruments`
    SET Instrument = "acoustic guitar"
    WHERE Instrument = "guitar";

DELETE FROM `Instruments`
    WHERE Instrument != "acoustic guitar"
    AND BandmateId != 4;

SELECT *
    FROM `Instruments`
    ORDER BY Id, BandmateId;

ALTER TABLE `Albums`
    ADD TrackAmt INT;

UPDATE `Albums`
    SET TrackAmt = (
        SELECT MAX(Position) 
        FROM `Tracklists` 
        WHERE AlbumId = Id
    );

SELECT *
    FROM `Albums`
    ORDER BY Year;