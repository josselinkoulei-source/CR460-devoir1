data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "cr460_kv" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.cr460.location
  resource_group_name = azurerm_resource_group.cr460.name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  rbac_authorization_enabled    = true
  soft_delete_retention_days    = 7
  public_network_access_enabled = true

  tags = {
    Projet = "DevoirCR460"
  }
}

data "azurerm_key_vault_secret" "cr460_vm_password" {
  name         = "vm-admin-password"
  key_vault_id = azurerm_key_vault.cr460_kv.id
}

output "key_vault_name" {
  value = azurerm_key_vault.cr460_kv.name
}

output "key_vault_uri" {
  value = azurerm_key_vault.cr460_kv.vault_uri
}

output "terraform_client_id" {
  value = data.azurerm_client_config.current.client_id
}

output "terraform_principal_id" {
  value = data.azurerm_client_config.current.object_id
}
