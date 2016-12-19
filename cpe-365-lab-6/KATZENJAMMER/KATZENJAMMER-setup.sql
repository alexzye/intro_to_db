/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `Albums`(
    Id INT NOT NULL, 
    Title VARCHAR(50), 
    Year INT, 
    Label VARCHAR(40), 
    Type VARCHAR(8),
    PRIMARY KEY(Id)
);

CREATE TABLE `Band`(
    Id INT NOT NULL, 
    First VARCHAR(15), 
    Last VARCHAR(15),
    PRIMARY KEY(Id)
);

CREATE TABLE `Songs`(
    SongId INT NOT NULL, 
    Title VARCHAR(40),
    PRIMARY KEY(SongId) 
);

CREATE TABLE `Tracklists`(
    AlbumId INT NOT NULL, 
    Position INT, 
    SongId INT, 
    FOREIGN KEY(AlbumId) REFERENCES `Albums`(Id), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId),
    PRIMARY KEY(AlbumId, Position)
);

CREATE TABLE `Instruments`(
    Id INT NOT NULL, 
    BandmateId INT, 
    Instrument VARCHAR(30), 
    FOREIGN KEY(Id) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandmateId) REFERENCES `Band`(Id),
    PRIMARY KEY(Id, BandmateId, Instrument)
);

CREATE TABLE `Performance`(
    SongId INT NOT NULL, 
    BandMate INT NOT NULL, 
    StagePosition VARCHAR(10), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandMate) REFERENCES `Band`(Id),
    PRIMARY KEY(SongId, BandMate, StagePosition)
);

CREATE TABLE `Vocals`(
    SongId INT NOT NULL, 
    BandMate INT NOT NULL, 
    Type VARCHAR(10), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandMate) REFERENCES `Band`(Id),
    PRIMARY KEY(SongId, BandMate, Type)
);
