output "sql_db_name" {
  value = module.sql-db.sql_db_name
}

output "cosmosdb_sql_container_id" {
  value = module.sql-container.cosmosdb_sql_container_id
}

output "cosmosdb_name" {
  value = module.cosmosdb-acct.cosmosdb_name
}