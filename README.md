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

---

## Package 08 - Event Handlers

### Objective

Demonstrate SSIS Event Handlers to handle task-level errors and perform additional actions when an error occurs during package execution.

### Components Used

- Execute SQL Task
- Event Handler
- OnError Event
- Error Log Table
- SQL Server Connection Manager

### Configuration

- Configured an `OnError` Event Handler for the Execute SQL Task.
- Added an Execute SQL Task inside the `OnError` event handler.
- Configured error logging to capture error details in an error log table.

### Scenario

- Intentionally generated an error using `SELECT 1/0`.
- The Execute SQL Task failed as expected.
- The `OnError` Event Handler was triggered.
- Error details were inserted into the error log table.
- Verified the error records in SQL Server.

---

## Package 09 - Parameters & Variables

### Objective

Demonstrate the use of SSIS Package Parameters, Expressions, Variables, and Parameter Mapping to make the package dynamic and reusable.

### Components Used

- Execute SQL Task
- Package Parameter
- Variable
- Parameter Mapping
- Result Set
- OLE DB Connection Manager

### Configuration

- Created a Package Parameter for the database name.
- Used an Expression to dynamically set the Connection Manager's database.
- Created variables to store runtime values.
- Configured Parameter Mapping to pass `CustomerKey` to the Execute SQL Task.
- Configured Result Set to store the query output in a variable.

### Scenario

- Created a Package Parameter for database configuration.
- Used the parameter through an Expression in the Connection Manager.
- Passed `CustomerKey` through Parameter Mapping to the Execute SQL Task.
- Configured the Result Set to store `CustomerName` in an SSIS variable.
- Executed the package successfully.

---

## Package 10 - SSIS Logging

### Objective

Demonstrate SSIS Logging functionality to capture package execution details for monitoring, auditing, and troubleshooting.

### Components Used

- Execute SQL Task
- SSIS Logging
- SSIS Log Provider for SQL Server
- SQL Server Connection Manager
- `sysssislog` table

### Logging Configuration

- Log Provider = SSIS log provider for SQL Server
- Logging configured at package level
- Events configured:
  - PackageStart
  - PackageEnd
  - OnPreExecute
  - OnPostExecute
  - OnProgress

### Scenario

- Created an Execute SQL Task with `SELECT 1/1`.
- Enabled SSIS Logging using the SQL Server Log Provider.
- Executed the package successfully.
- Verified that package and task execution events were recorded in the `sysssislog` table.
- Used the `sysssislog` table to review execution details.

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
