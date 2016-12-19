/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT COUNT(*) Total
FROM `Band` b, `Instruments` i
WHERE b.First = "Turid"
AND i.BandMateId = b.Id
AND (i.Instrument = "bass"
OR i.Instrument = "bass balalaika");

-- Q2
SELECT count(*) Total
FROM `Band` b, `Performance` p 
WHERE b.First = "Anne-Marit"
AND p.BandMate = b.Id
AND p.StagePosition = "center";

-- Q3
SELECT DISTINCT COUNT(*) AS Total
FROM `Performance` p, `Vocals` v, `Band` b, `Band` b1
WHERE b.First = "Turid"
AND b1.First = "Solveig"
AND v.Bandmate = b1.Id
AND p.BandMate = b.Id
AND v.Type = "lead"
AND v.SongId = p.SongId
AND (p.StagePosition = "left" 
OR p.StagePosition = "right"
OR p.StagePosition = "center");

-- Q4
SELECT COUNT(DISTINCT i.Instrument) as Instruments
FROM `Instruments` i, `Band` b
WHERE b.First = "Anne-Marit"
AND b.Id = i.BandMateId;

-- Q5
SELECT DISTINCT i.Instrument
FROM `Band` b, `Band` b1, `Instruments` i
WHERE b.First = "Anne-Marit"
AND b1.First = "Solveig"
AND (b.Id = i.BandMateId OR b1.Id = i.BandMateId);

-- Q6
SELECT COUNT(DISTINCT i.BandMateId) AS Total
FROM `Instruments` i
WHERE i.Instrument = "accordion";

-- Q7
SELECT COUNT(*) AS Total
FROM `Instruments` i, `Performance` p, `Instruments` i2, `Performance` p2
WHERE i.Id = p.SongId
AND i2.Id = p2.SongId
AND i.BandMateId = p.BandMate
AND i2.BandMateId = p2.BandMate
AND i.Id = i2.Id
AND i.BandMateId < i2.BandMateId
AND i.Instrument = i2.Instrument;

-- Q8
SELECT COUNT(*) AS Total
FROM `Band` b1, `Band` b2, `Band` b3, `Band` b4,
`Performance` p1, `Performance` p2, `Performance` p3, `Performance` p4
WHERE b1.First = "Marianne"
AND b2.First = "Turid"
AND b3.First = "Solveig"
AND b4.First = "Anne-Marit"
AND p1.BandMate = b1.Id
AND p2.BandMate = b2.Id
AND p3.BandMate = b3.Id
AND p4.BandMate = b4.Id
AND p1.SongId = p2.SongId
AND p2.SongId = p3.SongId
AND p3.SongId = p4.SongId
AND p1.StagePosition = "right"
AND p2.StagePosition = "center"
AND p3.StagePosition = "back"
AND p4.StagePosition = "left";

-- Q9
SELECT b1.First, b2.First, b3.First, b4.First
FROM `Performance` p1, `Performance` p2, `Performance` p3, `Performance` p4,
`Band` b1, `Band` b2, `Band` b3, `Band` b4 
WHERE p1.SongId = p2.SongId
AND p2.SongId = p3.SongId
AND p3.SongId = p4.SongId
AND p1.StagePosition = "right"
AND p2.StagePosition = "center"
AND p3.StagePosition = "back"
AND p4.StagePosition = "left"
AND p1.BandMate = b1.Id
AND p2.BandMate = b2.Id
AND p3.BandMate = b3.Id
AND p4.BandMate = b4.Id
ORDER BY b1.First, b2.First, b3.First, b4.First;

-- Q10
SELECT p1.StagePosition AS Turid, 
p2.StagePosition AS Solveig, 
p3.StagePosition AS Marianne, 
p4.StagePosition AS AnneMarit
FROM `Performance` p1, `Performance` p2, `Performance` p3, `Performance` p4,
`Band` b1, `Band` b2, `Band` b3, `Band` b4 
WHERE p1.SongId = p2.SongId
AND p2.SongId = p3.SongId
AND p3.SongId = p4.SongId
AND p1.StagePosition != p2.StagePosition 
AND p1.StagePosition != p3.StagePosition 
AND p1.StagePosition != p4.StagePosition
AND p2.StagePosition != p1.StagePosition 
AND p2.StagePosition != p3.StagePosition 
AND p2.StagePosition != p4.StagePosition
AND p3.StagePosition != p4.StagePosition
AND p1.BandMate = b1.Id
AND p2.BandMate = b2.Id
AND p3.BandMate = b3.Id
AND p4.BandMate = b4.Id
AND b1.First = "Turid"
AND b2.First = "Solveig"
AND b3.First = "Marianne"
AND b4.First = "Anne-Marit"
ORDER BY p1.StagePosition, p2.StagePosition, p3.StagePosition, p4.StagePosition;
