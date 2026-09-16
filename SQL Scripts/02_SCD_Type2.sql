Select * from Sales
Select * from ETL_Audit
Select* from Customer



TRUNCATE TABLE Customer;	
Truncate table ETL_Audit


INSERT INTO Customer
(CustomerID, CustomerName, City, StartDate, EndDate, IsCurrent)
VALUES
(1,'John','Delhi',GETDATE(),NULL,1),
(2,'Mary','Mumbai',GETDATE(),NULL,1),
(3,'David','Pune',GETDATE(),NULL,1),
(4,'Sam','Chennai',GETDATE(),NULL,1);
-----------------------------------------------
--SPs used--

CREATE PROCEDURE usp_AuditStart
    @PackageName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ETL_Audit
    (
        PackageName,
        StartTime,
        RowsInserted,
        RowsUpdated,
        Status
    )
    VALUES
    (
        @PackageName,
        GETDATE(),
        0,
        0,
        'Running'
    );

    SELECT SCOPE_IDENTITY() AS AuditID;
END;

EXEC usp_AuditStart @PackageName='Customer_SCD_Type2_Load'

---------------------------------------------------------------------

CREATE PROCEDURE usp_AuditEnd
    @AuditID INT,
    @RowsInserted INT,
    @RowsUpdated INT,
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ETL_Audit
    SET
        EndTime = GETDATE(),
        RowsInserted = @RowsInserted,
        RowsUpdated = @RowsUpdated,
        Status = @Status
    WHERE AuditID = @AuditID;
END;


EXEC usp_AuditEnd @AuditID = 1, @RowsInserted = 5, @RowsUpdated = 2, @Status = 'Success';

