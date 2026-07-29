---Create commands

CREATE TABLE Customer_Merge
(
    CustomerID INT,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Orders
(
    OrderID INT,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

CREATE TABLE Customer_Order_Report
(
    CustomerID INT,
    CustomerName VARCHAR(100),
    City VARCHAR(100),
    OrderID INT,
    Amount DECIMAL(10,2)
);


---Insert commands

INSERT INTO Customer_Merge
VALUES
(1,'John','Delhi'),
(2,'Mary','Mumbai'),
(3,'David','Pune'),
(4,'Sam','Chennai');


INSERT INTO Orders
VALUES
(101,1,1200),
(102,2,2500),
(103,4,900),
(104,5,1500);


---Test queries
Select * from Customer_Merge
Select * from Orders
Select * from Customer_Order_Report
TRUNCATE TABLE Customer_Order_Report;