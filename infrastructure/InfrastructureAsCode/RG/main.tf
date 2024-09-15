resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = format("%s%s%s%s", var.resource_group_location_prefix, var.resource_group_stage_prefix, var.resource_group_name_prefix, var.owner_name)
}
