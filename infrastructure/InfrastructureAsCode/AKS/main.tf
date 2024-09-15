resource "azurerm_kubernetes_cluster" "cluster" {
  name                = format("%s%s%s%s", var.kubernetes_cluster_location_prefix, var.kubernetes_cluster_stage_prefix, var.kubernetes_cluster_name_prefix, var.owner_name)
  location            = var.kubernetes_cluster_location
  resource_group_name = "weudrgvol1" 
  dns_prefix          = "vol1aksdns" 

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy = "azure"
  }
  
  tags = {
    Environment = "Development"
  }
}

