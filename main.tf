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

resource "azurerm_sql_database" "test" {
  count               = "${length(var.databases)}"
  name                = "${element(keys(var.databases), count.index)}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  server_name         = "${var.name}"
}
