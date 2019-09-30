output "sqlserver_name" {
  value = "${azurerm_sql_server.sqlserver.name}"
}

output "sqlserver_admin_password" {
  description = "Password for SQL Server admin user."
  value = "${random_string.dbServerPassword.value}"
}
