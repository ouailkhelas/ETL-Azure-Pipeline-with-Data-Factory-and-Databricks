variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-data-pipeline"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique)"
  type        = string
  default     = "stgdatalake"
}

variable "adf_name" {
  description = "Name of the Data Factory"
  type        = string
  default     = "adf-pipeline"
}

variable "databricks_name" {
  description = "Name of the Databricks workspace"
  type        = string
  default     = "dbks-workspace"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    Project     = "DataPipeline"
    Owner       = "DataTeam"
  }
}
