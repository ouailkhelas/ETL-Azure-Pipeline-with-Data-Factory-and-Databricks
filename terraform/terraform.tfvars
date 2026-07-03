resource_group_name   = "rg-data-pipeline-dev"
location              = "eastus"
storage_account_name  = "stgdatalake6437prod123"
adf_name              = "adf-sales-pipeline"
databricks_name       = "dbks-sales-workspace"

tags = {
  Environment = "Dev"
  Project     = "SalesDataPipeline"
  Owner       = "DataTeam"
  CostCenter  = "Analytics"
}
