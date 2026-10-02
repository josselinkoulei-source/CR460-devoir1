resource "azurerm_container_group" "cr460_container" {
  name                = "aci-cr460-devoir1"
  location            = azurerm_resource_group.cr460.location
  resource_group_name = azurerm_resource_group.cr460.name

  os_type         = "Linux"
  ip_address_type = "Public"
  restart_policy  = "Always"

  container {
    name   = "cr460-web"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
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