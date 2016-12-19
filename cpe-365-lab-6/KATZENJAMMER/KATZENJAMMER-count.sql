/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT b.First, COUNT(*) AS Lead
FROM `Band` b, `Vocals` v
WHERE b.Id = v.BandMate
AND v.Type = "lead"
GROUP BY b.First
ORDER BY Lead DESC;

-- Q2
SELECT b.First, 
COUNT(DISTINCT i.Instrument) AS Instruments
FROM `Band` b, `Albums` a, `Instruments` i, `Tracklists` t
WHERE a.Title = "Rockland"
AND a.Id = t.AlbumId
AND t.SongId = i.Id
AND i.BandmateId = b.Id
GROUP BY b.First
ORDER BY b.First;

-- Q3
SELECT p.StagePosition, 
COUNT(*) AS Amount
FROM `Band` b, `Performance` p
WHERE b.First = 'Solveig'
AND p.BandMate = b.Id
GROUP BY p.StagePosition
ORDER BY Amount ASC;

-- Q4
SELECT b2.First, COUNT(*) AS Count
FROM `Instruments` i, `Band` b, `Band` b2,
`Performance` p, `Songs` s, `Instruments` i2
WHERE b.First = "Anne-Marit"
AND i.BandMateId = b.Id
AND p.BandMate = b.Id
AND p.SongId = i.Id
AND p.StagePosition = "left"
AND s.SongId = p.SongId
AND i.Id = i2.Id
AND i2.BandmateId != b.Id
AND (i2.Instrument = "bass" OR i2.Instrument = "bass balalaika")
AND b2.Id = i2.BandMateId
GROUP BY b2.First
ORDER BY Count;

-- Q5
SELECT i.Instrument
FROM `Instruments` i
GROUP BY i.Instrument
HAVING COUNT(DISTINCT i.BandmateId) = 4
ORDER BY i.Instrument;

-- Q6
-- 42 is the number of songs there are
SELECT b.First, COUNT(*) - 42 AS Count
FROM `Band` b, `Instruments` i
WHERE b.Id = i.BandmateId
GROUP BY b.First
HAVING COUNT(*) >= 42
order by b.First;

-- Q7
SELECT b.First, COUNT(DISTINCT i.Instrument) AS Count
FROM `Instruments` i, `Band` b
WHERE b.Id = i.BandMateId
GROUP BY b.First
ORDER BY b.First;