provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
  subscription_id = var.subscription_id
  client_id       = var.clientId
  client_secret   = var.client_secret
  tenant_id       = var.tenantId

} 
resource "random_string" "dbServerPassword" {
  length  = 24
  special = false
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = lower(var.name)
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_string.dbServerPassword.result
}

resource "azurerm_sql_database" "sqldatabase" {
  name                = var.databases
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = lower(var.name)
  edition             = "Basic"
}

resource "azurerm_sql_firewall_rule" "sqlserver_firewall_rule" {
  count               = length(var.firewall_rules)
  name                = element(var.firewall_rules, count.index).name
  resource_group_name = var.rg_name
  server_name         = azurerm_sql_server.sqlserver.name
  start_ip_address    = element(var.firewall_rules, count.index).start_ip_address
  end_ip_address      = element(var.firewall_rules, count.index).end_ip_address
}
