resource "azurerm_container_registry" "cr460_acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.cr460.name
  location            = azurerm_resource_group.cr460.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    Projet = "DevoirCR460"
  }
}

resource "azurerm_user_assigned_identity" "cr460_aci" {
  name                = "id-cr460-aci"
  resource_group_name = azurerm_resource_group.cr460.name
  location            = azurerm_resource_group.cr460.location

  tags = {
    Projet = "DevoirCR460"
  }
}

output "acr_login_server" {
  value = azurerm_container_registry.cr460_acr.login_server
}