/*
Alex Ye
aye01@calpoly.edu
*/
CREATE TABLE `customers`(
    Id INT NOT NULL, 
    Last VARCHAR(10), 
    First VARCHAR(10),
    PRIMARY KEY(Id)
);

CREATE TABLE `goods`(
    Id VARCHAR(15) NOT NULL, 
    Flavor VARCHAR(10), 
    Food VARCHAR(10), 
    Price FLOAT,
    PRIMARY KEY(Id),
    UNIQUE(Flavor, Food)
);

CREATE TABLE `receipts`(
    ReceiptNumber INT NOT NULL, 
    Date DATE, 
    Customer INT NOT NULL, 
    FOREIGN KEY(Customer) REFERENCES `customers`(Id),
    PRIMARY KEY(ReceiptNumber)
);

CREATE TABLE `items`(
    Receipt INT NOT NULL, 
    Ordinal INT NOT NULL, 
    Item VARCHAR(20), 
    FOREIGN KEY(Receipt) REFERENCES `receipts`(ReceiptNumber),
    FOREIGN KEY(Item) REFERENCES `goods`(Id),
    PRIMARY KEY(Receipt, Ordinal)
);
