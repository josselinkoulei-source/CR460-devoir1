terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}

output "azure_subscription_name" {
  value = data.azurerm_subscription.current.display_name
}

resource "azurerm_resource_group" "cr460" {
  name     = var.resource_group_name
  location = var.azure_region

  tags = {
    Projet      = "DevoirCR460"
    Approbation = "Manuelle"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.cr460.name
}

resource "azurerm_virtual_network" "cr460_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.cr460.location
  resource_group_name = azurerm_resource_group.cr460.name

  tags = {
    Projet = "DevoirCR460"
  }
}

output "virtual_network_name" {
  value = azurerm_virtual_network.cr460_vnet.name
}
