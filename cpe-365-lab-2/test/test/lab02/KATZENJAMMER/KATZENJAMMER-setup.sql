/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `Albums`(
    Id INT NOT NULL PRIMARY KEY, 
    Title VARCHAR(50), 
    Year INT, 
    Label VARCHAR(40), 
    Type VARCHAR(8)
);

CREATE TABLE `Band`(
    Id INT NOT NULL PRIMARY KEY, 
    First VARCHAR(15), 
    Last VARCHAR(15)
);

CREATE TABLE `Songs`(
    SongId INT NOT NULL PRIMARY KEY, 
    Title VARCHAR(40)
);

CREATE TABLE `Tracklists`(
    AlbumId INT NOT NULL, 
    Position INT, 
    SongId INT, 
    FOREIGN KEY(AlbumId) REFERENCES `Albums`(Id), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId)
);

CREATE TABLE `Instruments`(
    Id INT NOT NULL, 
    BandmateId INT, 
    Instrument VARCHAR(30), 
    FOREIGN KEY(Id) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandmateId) REFERENCES `Band`(Id)
);

CREATE TABLE `Performance`(
    SongId INT NOT NULL, 
    BandMate INT NOT NULL, 
    StagePosition VARCHAR(10), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandMate) REFERENCES `Band`(Id)
);

CREATE TABLE `Vocals`(
    SongId INT NOT NULL, 
    BandMate INT NOT NULL, 
    Type VARCHAR(10), 
    FOREIGN KEY(SongId) REFERENCES `Songs`(SongId), 
    FOREIGN KEY(BandMate) REFERENCES `Band`(Id)
);
