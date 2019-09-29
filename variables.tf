variable "name" {}
variable "rg_name" {}
variable "location" {}
variable "tenant_id" {}
variable "sql_admin_group_object_id" {}
variable "databases" {
  default = []
}
