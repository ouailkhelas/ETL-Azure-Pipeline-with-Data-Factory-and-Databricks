# Portal Configuration Guide

## Step 1: Create Data Lake Container
1. Go to Azure Portal → Storage Account
2. Navigate to Containers → Create container
3. Name: `datalake`
4. Upload your `sales.csv` to `raw/` folder

## Step 2: Azure Data Factory Setup

### Create Linked Services
1. ADF Studio → Manage → Linked Services
2. Create `AzureDataLakeStorage` linked service
3. Create `Databricks` linked service with token

### Create Datasets
1. **Input Dataset**: `SalesCSV`
   - Type: Delimited Text
   - Location: `datalake/raw/sales.csv`
2. **Output Dataset**: `ProcessedData`
   - Location: `datalake/processed/`

### Create Pipeline
1. Name: `SalesDataPipeline`
2. Add Copy Activity: CSV → Data Lake
3. Add Databricks Activity: Run notebook
4. Configure success/failure triggers

## Step 3: Databricks Setup

### Create Cluster
1. Databricks workspace → Clusters → Create
2. Name: `sales-cluster`
3. Databricks Runtime: 13.x LTS

### Create Notebook
```python
# Sales Data Transformation
df = spark.read.csv("abfss://datalake@{storageaccount}.dfs.core.windows.net/raw/sales.csv", header=True)
df_clean = df.dropna()
df_processed = df_clean.groupBy("product").sum("amount")
df_processed.write.mode("overwrite").csv("abfss://datalake@{storageaccount}.dfs.core.windows.net/processed/")
```

## Step 4: Power BI Dashboard
1. Power BI Desktop → Get Data → Azure Data Lake
2. Connect to processed data folder
3. Create visualizations:
   - Sales by Product (bar chart)
   - Total Revenue (card)
   - Daily Trend (line chart)
4. Publish to Power BI Service

## Important Notes
- ADF orchestrates but does NOT send data to Databricks
- Databricks reads directly from Data Lake using Spark
- Databricks writes results back to Data Lake
- Power BI connects to processed data in Data Lake
- ADF triggers Databricks notebook execution only
