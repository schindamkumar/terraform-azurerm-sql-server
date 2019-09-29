resource "random_string" "dbServerPassword" {
  length  = 24
  special = false
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = "${var.name}"
  resource_group_name          = "${var.rg_name}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "${random_string.dbServerPassword.result}"
}

resource "azurerm_sql_active_directory_administrator" "sql_admin" {
  server_name         = "${var.name}"
  resource_group_name = "${var.rg_name}"
  login               = "az-sql-server-admins"
  tenant_id           = "${var.tenant_id}"
  object_id           = "${var.sql_admin_group_object_id}"
}

resource "azurerm_sql_database" "test" {
  count               = "${length(var.databases)}"
  name                = "${element(keys(var.databases), count.index)}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  server_name         = "${var.name}"
}
