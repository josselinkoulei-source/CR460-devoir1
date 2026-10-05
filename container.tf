resource "azurerm_container_group" "cr460_container" {
  name                = var.container_group_name
  resource_group_name = azurerm_resource_group.cr460.name
  location            = azurerm_resource_group.cr460.location

  os_type         = "Linux"
  ip_address_type = "Public"
  restart_policy  = "Always"

  identity {
    type = "UserAssigned"

    identity_ids = [
      azurerm_user_assigned_identity.cr460_aci.id
    ]
  }

  image_registry_credential {
    server                    = azurerm_container_registry.cr460_acr.login_server
    user_assigned_identity_id = azurerm_user_assigned_identity.cr460_aci.id
  }

  container {
    name   = var.container_name
    image  = "${azurerm_container_registry.cr460_acr.login_server}/cr460-web:v1"
    cpu    = 1
    memory = 1.5

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    Projet = "DevoirCR460"
  }
}

output "container_name" {
  value = azurerm_container_group.cr460_container.name
}

output "container_url" {
  value = "http://${azurerm_container_group.cr460_container.ip_address}"
}