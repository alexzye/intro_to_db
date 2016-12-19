
-- Q1
SELECT First FROM `Band`
WHERE Id NOT IN
(
    SELECT DISTINCT BandMateId 
    FROM `Instruments`
    WHERE Instrument = "accordion"
);

-- Q2
SELECT * FROM `Songs`
WHERE SongId NOT IN 
(
    SELECT DISTINCT SongId FROM `Vocals`
);

-- Q3
SELECT s.Title FROM `Instruments` i, `Songs` s
WHERE i.Id = s.SongId
GROUP BY Id
HAVING COUNT(*) >= 
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(*) AS ct FROM `Instruments` i
        GROUP BY Id
    ) a
);

-- Q4
SELECT b.First, i.Instrument, COUNT(*) AS Count FROM `Instruments` i, `Band` b
WHERE i.BandmateId = b.Id
GROUP BY i.BandmateId, i.Instrument
HAVING COUNT(*) >=
(
    SELECT MAX(Count) FROM 
    (
        SELECT Instrument, BandmateId, COUNT(*) AS Count FROM `Instruments`
        GROUP BY BandmateId, Instrument
    ) a
    WHERE a.BandmateId = i.BandmateId
)
ORDER BY b.First;

-- Q5
SELECT i.Instrument FROM `Instruments` i
WHERE i.Instrument NOT IN
(
    SELECT DISTINCT i.Instrument 
    FROM `Instruments` i, `Band` b
    WHERE i.BandmateId = b.Id
    AND b.First <> "Anne-Marit"
)
ORDER BY Instrument;

-- Q6
SELECT b.First FROM `Instruments` i, `Band` b
WHERE i.BandmateId = b.Id
GROUP BY i.BandmateId
HAVING COUNT(DISTINCT Instrument) <=
(
    SELECT MIN(ct) FROM 
    (
        SELECT COUNT(DISTINCT Instrument) AS ct FROM `Instruments`
        GROUP BY BandmateId
    ) a
);

-- Q7
SELECT b.First FROM `Performance` p, `Band` b
WHERE p.StagePosition = "left"
AND p.BandMate = b.Id
GROUP BY p.BandMate
HAVING count(*) >=
(
    SELECT MAX(ct) FROM 
    (
    SELECT COUNT(*) AS ct FROM `Performance`
    WHERE StagePosition = "left"
    GROUP BY BandMate
    ) a
);

-- Q8
SELECT Instrument FROM Instruments
GROUP BY Instrument
HAVING COUNT(DISTINCT Id) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(DISTINCT Id) AS ct FROM Instruments
        GROUP BY Instrument
    ) a
);

-- Q9
SELECT i.Instrument FROM `Instruments` i, `Band` b
WHERE i.BandmateId = b.Id
AND b.First = "Turid"
AND i.Id NOT IN 
(
    SELECT DISTINCT SongId FROM `Tracklists`
)
GROUP BY i.Instrument
HAVING COUNT(*) >=
(
    SELECT MAX(ct) FROM 
    (
        SELECT COUNT(*) AS ct FROM `Instruments` i, `Band` b
        WHERE i.BandmateId = b.Id
        AND b.First = "Turid"
        AND i.Id NOT IN 
        (
            SELECT DISTINCT SongId FROM `Tracklists`
        )
        GROUP BY i.Instrument
    ) a
);