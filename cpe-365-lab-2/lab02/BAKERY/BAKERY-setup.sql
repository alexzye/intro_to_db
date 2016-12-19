/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `customers`(Id INT NOT NULL PRIMARY KEY, Last VARCHAR(10), First VARCHAR(10));
CREATE TABLE `goods`(Id VARCHAR(15) NOT NULL PRIMARY KEY, Flavor VARCHAR(10), Food VARCHAR(10), Price FLOAT);
CREATE TABLE `receipts`(ReceiptNumber INT NOT NULL PRIMARY KEY, Date DATE, Customer INT NOT NULL, FOREIGN KEY(Customer) REFERENCES `customers`(Id));
CREATE TABLE `items`(Receipt INT NOT NULL, Ordinal INT NOT NULL, Item VARCHAR(20), FOREIGN KEY(Receipt) REFERENCES `receipts`(ReceiptNumber));