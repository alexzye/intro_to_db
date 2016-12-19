CREATE TABLE `appellations`(Id INT NOT NULL, Appellation VARCHAR(50) PRIMARY KEY, County VARCHAR(20), State VARCHAR(15), Area VARCHAR(20), isAVA VARCHAR(5));
CREATE TABLE `grapes`(Id INT NOT NULL, Grape VARCHAR(25) PRIMARY KEY, Color VARCHAR(10), UNIQUE(Id));
CREATE TABLE `wine`(Id INT NOT NULl PRIMARY KEY, Grape VARCHAR(25), Winery VARCHAR(40), Appellation VARCHAR(50), State VARCHAR(15), Name VARCHAR(50), Year INT, Price INT, Score INT, Cases INT, Drink VARCHAR(7), FOREIGN KEY(Grape) REFERENCES `grapes`(Grape), FOREIGN KEY(Appellation) REFERENCES `appellations`(Appellation));


