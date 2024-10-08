output "cluster_name" {
  value = azurerm_kubernetes_cluster.cluster.name
}

output "principal_id"{
    value = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
}