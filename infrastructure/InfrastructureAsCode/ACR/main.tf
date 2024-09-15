resource "azurerm_container_registry" "container" {
  name                = format("%s%s%s%s", var.container_registry_location_prefix, var.container_registry_stage_prefix, var.container_registry_name_prefix, var.owner_name)
  resource_group_name = "weudrgvol1" //todo
  location            = var.container_registry_location
  sku                 = "Basic"
}

