# On-Premises SQL Server to Azure Data Migration using Azure Data Factory

## 📌 Project Overview

This project demonstrates a hands-on data migration workflow using Azure Data Factory (ADF) to move data from an on-premises SQL Server environment to Azure.

The project focuses on configuring connectivity, creating ADF components, executing data movement pipelines, and validating the migrated data in Azure SQL Database.

## 🛠️ Technologies & Tools

- Azure Data Factory
- Azure SQL Database
- On-Premises SQL Server
- Self-hosted Integration Runtime
- Azure Portal
- SQL Server Management Studio (SSMS)

## 🏗️ Architecture

On-Premises SQL Server  
↓  
Self-hosted Integration Runtime  
↓  
Azure Data Factory  
↓  
Copy Activity  
↓  
Azure SQL Database

## 🔧 Azure Resources

- Resource Group: `rg-adf-practice`
- Data Factory: `adf-swati-practice`
- Self-hosted Integration Runtime: `IROnPremSQL`
- Azure SQL Database: `CustomerDB`

## ⚙️ Key Implementation Steps

1. Created the Azure resources required for the migration.
2. Configured a Self-hosted Integration Runtime to enable connectivity between the on-premises SQL Server and Azure.
3. Created an Azure SQL Linked Service.
4. Created datasets for the source and destination.
5. Developed an ADF pipeline using Copy Activity.
6. Configured source and destination mappings.
7. Executed and tested the pipeline.
8. Monitored pipeline execution and activity status.
9. Validated the migrated data in Azure SQL Database.

## 🧪 Testing & Validation

- Tested connectivity between on-premises SQL Server and Azure.
- Executed the ADF pipeline and monitored activity execution.
- Validated record/data movement in the Azure SQL destination.
- Troubleshot connectivity and configuration issues during development.

## 📸 Screenshots

Screenshots demonstrating the project implementation are available in the `screenshots` folder.

## 🎯 Key Learning

This project provided hands-on experience with:

- Azure Data Factory pipeline development
- Self-hosted Integration Runtime
- On-premises to Azure data connectivity
- Azure SQL Database
- ADF Copy Activity
- Linked Services and Datasets
- Pipeline execution and monitoring
- Data migration validation
