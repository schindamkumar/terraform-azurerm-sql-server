variable "name" {
  description = "SQL Server resource name."
}
variable "rg_name" {
  description = "Resource Group name."
}
variable "subscription_id" {
  description = ""
}
variable "clientId" {
  description = ""
}
variable "client_secret" {
  description = ""
}
variable "tenantId" {
  description = ""
}
variable "location" {
  description = "SQL Server resource location."
}
variable "databases" {
  description = "A map of database names and editions."
  default     = {}
}
variable "firewall_rules" {
  description = "Range of IP addresses to allow connections."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}
