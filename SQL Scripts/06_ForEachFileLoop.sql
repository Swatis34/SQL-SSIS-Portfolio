/****** Script for SelectTopNRows command from SSMS  ******/

Truncate Table Customer_Merge


--3 Different source files

--Customer1.txt
CustomerID,CustomerName,City
1,John,Delhi
2,Mary,Mumbai
--Customer2.txt
CustomerID,CustomerName,City
3,David,Pune
4,Sam,Noida
--Customer3.txt
CustomerID,CustomerName,City
5,Riya,Jaipur
6,Amit,Gurgaon

--Test Query Results

Select * from  Customer_Merge