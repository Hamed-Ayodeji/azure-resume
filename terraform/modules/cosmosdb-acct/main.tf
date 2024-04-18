resource "random_integer" "ri" {
  min                         = 10000
  max                         = 99999
}

resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                        = "${var.prefix}-cosmosdb-${random_integer.ri.result}"
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  offer_type                  = "Standard"
  kind                        = "GlobalDocumentDB"
  
  automatic_failover_enabled  = true

  consistency_policy {
    consistency_level         = "Session"
  }

  geo_location {
    location                  = var.rg_location
    failover_priority         = 0
  }

  geo_location {
    location                  = var.backup_location
    failover_priority         = 1
  }
}