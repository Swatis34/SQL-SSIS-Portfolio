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

## Package 01 - Customer Validation

### Objective

Demonstrate SSIS data validation by processing customer records from a source file and identifying valid and invalid customer data.

### Components Used

- Flat File Source
- Data Flow Task
- Lookup
- Derived Column
- Data Conversion
- OLE DB Destination
- SQL Server Connection Manager

### Input

- `Sales.txt` – sample source file containing customer/sales records.

### Configuration

- Loaded data from the `Sales.txt` source file.
- Used Data conversion and Derived Column according to the requirement.
- Used Lookup to validate customer records against the Sales table.
- Loaded valid records into the destination table.
- Redirected invalid/unmatched records for further review.

### Scenario

- Processed Sales records from the input Sales file.
- Validated customer information against the existing Customer table.
- Successfully loaded valid records into the destination.
- Captured invalid/unmatched records separately.
- Verified the package execution and output.

---

## Package 02 - Incremental Load

### Objective

Demonstrate an SSIS incremental load process to identify existing and new records and update/insert data accordingly.

### Components Used

- Data Flow Task
- Data Conversion
- Derived Column
- Lookup
- Conditional Split
- OLE DB Command
- OLE DB Destination
- SQL Server Connection Manager

### Configuration

- Converted and prepared source data using Data Conversion and Derived Column.
- Used Lookup to validate incoming records against existing customer/sales data.
- Redirected unmatched records to a reject table.
- Used Conditional Split to identify records requiring updates and new records.
- Used OLE DB Command to update existing records.
- Used OLE DB Destination to insert new records.

### Scenario

- Processed incoming sales records incrementally.
- Compared incoming records with existing data using Lookup.
- Identified matching records for update and new records for insertion.
- Updated existing records using OLE DB Command.
- Inserted new records into the destination table.
- Captured unmatched/rejected records separately.
- Successfully executed and verified the package flow.

---

## Package 03 - SCD Type 2 Customer Load

### Objective

Demonstrate Slowly Changing Dimension (SCD) Type 2 implementation in SSIS to maintain historical versions of customer records when customer attributes change.

### Components Used

- Flat File Source
- Data Conversion
- Lookup
- Derived Column
- Conditional Split
- Multicast
- OLE DB Command
- OLE DB Destination
- SQL Server Connection Manager

### Configuration

- Used Lookup to identify new and existing customer records.
- New customers were inserted directly into the Customer dimension table.
- Existing records were checked for attribute changes.
- Used Multicast to send changed records to two separate paths:
  - Update the existing record and mark it as historical.
  - Create and insert a new version of the changed customer record.

- Maintained `StartDate`, `EndDate`, and `IsCurrent` to track record history.
- Used a surrogate `CustomerKey` for different versions of the same customer.

### SCD Type 2 Logic

For a changed customer:

- Old record → `IsCurrent = 0` and `EndDate` populated.
- New record → new `CustomerKey`, updated attributes, `IsCurrent = 1`, and `EndDate = NULL`.

### Scenario

- Processed customer data from the source file.
- Identified new, existing, and changed customer records using Lookup.
- Inserted new customers.
- For changed customers, updated the existing record as historical and inserted a new current version.
- Successfully maintained customer history using SCD Type 2 logic.

---

## Package 04. Error Handling

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

## Package 05. Merge Join

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
SQL-SSIS-Portfolio/
│
├── Azure-ADF-Migration/
│   ├── screenshots/
│   └── README.md
│
├── Azure-AI-Customer-Support-Agent/
│   ├── screenshots/
│   └── README.md
│
├── Input files/
├── SQL Scripts/
├── SSIS/
├── Screenshots/
│
├── .gitattributes
├── .gitignore
└── README.md
```

---

## Author

Surbhi Sharma

SQL Server | SSIS | ETL Developer
