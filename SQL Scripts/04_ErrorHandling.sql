--Create table command

CREATE TABLE Customer_Validated
(
    CustomerID INT,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);


--Source file data
CustomerID|CustomerName|City
1|John|Delhi
2|Mary|Mumbai
3||Pune
4|Sam|
5|Alex|Hyderabad
6||


--Test queries

SELECT* FROM Customer_Validated
TRUNCATE TABLE Customer_Validated