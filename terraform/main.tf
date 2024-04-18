module "rg" {
  source                      = "./modules/rg"
  prefix                      = var.prefix
  location                    = var.location
}

module "cosmosdb-acct" {
  source                      = "./modules/cosmosdb-acct"
  prefix                      = var.prefix
  rg_location                 = module.rg.rg_location
  rg_name                     = module.rg.rg_name
  backup_location             = var.backup_location
  depends_on                  = [ module.rg ]
}

module "sql-db" {
  source                      = "./modules/sql-db"
  prefix                      = var.prefix
  rg_name                     = module.rg.rg_name
  cosmosdb_name               = module.cosmosdb-acct.cosmosdb_name
  depends_on                  = [ module.cosmosdb-acct ]
}

module "sql-container" {
  source                      = "./modules/sql-container"
  cosmosdb_sql_container_name = var.cosmosdb_sql_container_name
  rg_name                     = module.rg.rg_name
  cosmosdb_name               = module.cosmosdb-acct.cosmosdb_name
  sql_db_name                 = module.sql-db.sql_db_name
  partition_key_path          = var.partition_key_path
  depends_on                  = [ module.sql-db ]
}