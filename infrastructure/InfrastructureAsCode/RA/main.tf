resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = var.cluster_principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.azure_scope
  skip_service_principal_aad_check = true
}