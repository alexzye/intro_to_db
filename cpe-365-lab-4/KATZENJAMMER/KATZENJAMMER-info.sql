/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT s.Title
FROM `Albums` a, `Tracklists` t, `Songs` s
WHERE a.Id = t.AlbumId
AND t.SongId = s.SongId
AND a.Title = "Rockland"
ORDER BY t.Position;

-- Q2
SELECT b.First, i.Instrument
FROM `Songs` s, `Instruments` i, `Band` b
WHERE s.Title = "Shine Like Neon Rays"
AND s.SongId = i.Id
AND i.BandmateId = b.Id
ORDER BY b.First;

-- Q3
SELECT DISTINCT i.Instrument
FROM `Band` b, `Instruments` i, `Performance` p
WHERE b.First = "Turid"
AND p.BandMate = b.Id
AND b.Id = i.BandmateId
AND p.SongId = i.Id;

-- Q4
SELECT s.Title
FROM `Band` b, `Instruments` i, `Songs` s
WHERE b.First = "Solveig"
AND b.Id = i.BandmateId
AND s.SongId = i.Id
AND i.Instrument = "ukalele"
ORDER BY s.Title;

-- Q5
SELECT DISTINCT i.Instrument
FROM `Band` b, `Instruments` i, `Vocals` v
WHERE b.First = "Marianne"
AND b.Id = v.BandMate
AND v.SongId = i.Id
AND v.Type = "lead"
ORDER BY i.Instrument;

-- Q6
SELECT DISTINCT s.Title, s.SongId
FROM `Band` b, `Instruments` i, `Instruments` i2, 
`Instruments` i3, `Songs` s
WHERE b.First = "Anne-Marit"
AND b.Id = i.BandmateId
AND b.Id = i2.BandmateId
AND b.Id = i3.BandmateId
AND i3.Instrument != i2.Instrument
AND i3.Instrument != i.Instrument
AND i.Instrument != i2.Instrument
AND i.Id = s.SongId
AND i2.Id = s.SongId
AND i3.Id = s.SongId;

-- Q7
SELECT b1.First, b2.First, b3.First, b4.First
FROM `Performance` p1, `Performance` p2, `Performance` p3, 
`Performance` p4, `Songs` s, `Band` b1, `Band` b2, 
`Band` b3, `Band` b4
WHERE s.Title = "A Bar In Amsterdam"
AND s.SongId = p1.SongId
AND s.SongId = p2.SongId
AND s.SongId = p3.SongId
AND s.SongId = p4.SongId
AND b1.Id = p1.BandMate
AND b2.Id = p2.BandMate
AND b3.Id = p3.BandMate
AND b4.Id = p4.BandMate
and p1.StagePosition = "right"
and p2.StagePosition = "center"
and p3.StagePosition = "back"
and p4.StagePosition = "left";

-- Q8
SELECT DISTINCT b3.First, s.Title 
FROM `Band` b,`Band` b2,`Instruments` i,
`Performance` p,`Vocals` v,`Band` b3, 
`Songs` s
WHERE b.First = "Turid"
AND i.Instrument = "bass balalaika"
AND b.Id = i.BandmateId
AND b2.First = "Anne-Marit"
AND b2.Id = p.BandMate
AND p.StagePosition = "left"
AND p.SongId = i.Id
AND v.Type = "lead"
AND v.SongId = p.SongId
AND b3.Id = v.BandMate
AND v.SongId = s.SongId;
