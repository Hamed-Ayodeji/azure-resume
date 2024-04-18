resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql_db" {
  name                = "${var.prefix}-cosmosdb-sql-db"
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_name
}