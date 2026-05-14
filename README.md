# Modern Azure ETL Data Processing Pipeline

A complete end-to-end data pipeline demonstrating CSV ingestion, transformation, and visualization using Azure services.

## 🚀 Architecture Overview

```
CSV File → Azure Data Lake Gen2 → Azure Data Factory → Databricks → Power BI Dashboard
```

**Data Flow:**
1. CSV uploaded to ADLS Gen2 (raw folder)
2. ADF pipeline detects new file
3. ADF **orchestrates** (triggers Databricks notebook)
4. Databricks reads directly from Data Lake
5. Databricks transforms using Spark
6. Processed data written back to Data Lake
7. Power BI reads processed data for visualization

## 🎯  Key Architecture Concepts

**ADF = Orchestrator (Manager)**
- Monitors data arrival
- Triggers workflows
- Logs success/failure
- Schedules pipelines

**Databricks = Processing Engine (Worker)**
- Reads from Data Lake directly
- Transforms with Spark
- Writes results back
- Independent compute cluster

**Data Lake = Central Storage**
- Raw data ingestion
- Processed data repository
- Single source of truth

## 📍Project Structure

```
├── terraform/          # IaC - Creates cloud infrastructure
│   ├── provider.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── cloudshell/         # Deployment scripts
│   └── deploy.sh
├── portal/             # Manual setup guide
│   └── pipelineconfig.md
└── README.md
```

## 📍 Deployment Guide

### Phase 1: Infrastructure as Code (Terraform)
```bash
cd cloudshell/
bash deploy.sh
```
**Creates:** Resource Group, Storage Account, Data Factory, Databricks Workspace

### Phase 2: Portal Configuration
Follow `portal/pipelineconfig.md`:
- Create Data Lake container
- Configure ADF linked services & datasets
- Build ADF pipeline with triggers
- Create Databricks cluster & notebook
- Build Power BI dashboard

## 📍 Technologies Used

- **Terraform**: Infrastructure provisioning
- **Azure Data Lake Gen2**: Data storage (ADLS)
- **Azure Data Factory**: Orchestration & scheduling
- **Databricks**: Spark-based transformations
- **Power BI**: Data visualization
- **Azure Cloud Shell**: Deployment

## ✅ Use Case Example

**Scenario:** Daily sales CSV uploads from e-commerce platform

1. **Raw Data:** `sales.csv` → `datalake/raw/`
2. **Transform:** Remove nulls, aggregate by product
3. **Clean Data:** `processed/sales_clean/`
4. **Visualize:** Dashboard showing sales trends
