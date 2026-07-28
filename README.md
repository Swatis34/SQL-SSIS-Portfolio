# SQL-SSIS-Portfolio

SQL Server and SSIS projects for interview preparation and portfolio

# SQL-SSIS Portfolio

This repository contains SQL Server and SSIS ETL projects created for interview preparation and portfolio.

## Tools Used

- SQL Server 2019
- SSIS (SQL Server Integration Services)
- Visual Studio 2019
- SSMS

---

## Completed Packages

### 1. Customer Validation

**Objective**

- Validate customer records before loading into SQL Server.

**Transformations Used**

- Flat File Source
- Derived Column
- Conditional Split
- OLE DB Destination

**Output**

- Valid records loaded into Customer table.
- Invalid records redirected.

---

### 2. Incremental Load

**Objective**

- Load only new customer records.
- Skip records already present in destination.

**Transformations Used**

- Flat File Source
- Lookup
- Conditional Split
- OLE DB Destination

**Output**

- Only new records inserted.
- Duplicate records ignored.

---

### 3. SCD Type 2 Customer Load

**Objective**

- Maintain complete history of customer changes.

**Scenario**
If customer city changes:

- Existing record marked as inactive.
- EndDate updated.
- New record inserted.
- New Surrogate Key generated.

**Transformations Used**

- Lookup
- Conditional Split
- OLE DB Command
- Derived Column
- Union All
- OLE DB Destination
- Row Count

**Audit Logging**

- Package Name
- Start Time
- End Time
- Rows Inserted
- Rows Updated
- Status

**Test Result**

- Successfully tested with multiple source files.
- Verified inserts and updates.

---

## 4. Error Handling

**Objective**

- Separate valid and invalid records before loading data into SQL Server.

**Transformations Used**

- Flat File Source
- Conditional Split
- OLE DB Destination
- Flat File Destination

**Validation Logic**

- CustomerName must not be blank.
- City must not be blank.

**Output**

- Valid records loaded into `Customer_Validated`.
- Invalid records redirected to `Rejected_Customers.txt`.

## Folder Structure

```
SQL-SSIS-Portfolio
│
├── SSIS
├── SQL_Scripts
├── Screenshots
└── README.md
```

---

## Author

Surbhi Sharma

SQL Server | SSIS | ETL Developer
