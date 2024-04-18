resource "azurerm_cosmosdb_sql_container" "cosmosdb_sql_container" {
  name                = var.cosmosdb_sql_container_name
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_name
  database_name       = var.sql_db_name
  partition_key_path  = var.partition_key_path
}