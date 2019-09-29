variable "name" {
  description = "SQL Server resource name."
}
variable "rg_name" {
  description = "Resource Group name."
}
variable "location" {
  description = "SQL Server resource location."
}
variable "databases" {
  default = []
}
