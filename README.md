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

---

## 5. Merge Join

**Objective**

- Combine customer and order data using a common key (`CustomerID`).

**Transformations Used**

- OLE DB Source
- Sort
- Merge Join
- OLE DB Destination

**Join Types Practiced**

- Inner Join
- Left Outer Join
- Full Outer Join

**Key Learning**

- Merge Join requires both inputs to be sorted.
- Merge combines rows (similar to UNION ALL).
- Merge Join combines columns based on a matching key (similar to SQL JOIN).

**Output**

- Created a consolidated customer-order report.

---

# Package 06 - ForEach Loop Container

## Objective

Demonstrate how to process multiple flat files dynamically using SSIS ForEach Loop Container and Expressions without creating multiple Data Flow Tasks.

## Components Used

- ForEach Loop Container
- Flat File Connection Manager
- Flat File Source
- OLE DB Destination
- Variables
- Expressions

## Package Flow

ForEach Loop Container
↓
Data Flow Task
↓
Flat File Source
↓
OLE DB Destination

## Configuration

### ForEach Loop

- Enumerator: ForEach File Enumerator
- Folder: InputFiles
- Files: \*.txt
- Retrieve File Name: Fully Qualified

### Variable

- User::FileName

### Expression

Flat File Connection Manager → ConnectionString

```
@[User::FileName]
```

## Scenario

- Processed multiple text files from a folder.
- Used a single Data Flow Task to process all files.
- Loaded records from all files into a SQL Server table.
- Verified successful processing of all input files.

## Learning Outcomes

- ForEach File Enumerator
- Variable Mapping
- Dynamic Connection String
- Expressions in SSIS
- Processing multiple files using a single package

---

## Package 07 - Checkpoints

### Objective

Demonstrate SSIS Checkpoint functionality to resume package execution after a failure.

### Components Used

- Execute SQL Task
- Package Checkpoints

### Package Properties

- SaveCheckpoints = True
- CheckpointUsage = IfExists
- CheckpointFileName configured

### Scenario

- Executed first SQL task successfully.
- Simulated package failure using `SELECT 1/0`.
- Fixed the failed SQL statement.
- Re-executed the package successfully.

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
