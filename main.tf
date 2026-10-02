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
  name     = "rg-cr460-devoir1-jkoulei"
  location = "Canada Central"

  tags = {
    Projet = "DevoirCR460"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.cr460.name
}

resource "azurerm_virtual_network" "cr460_vnet" {
  name                = "vnet-cr460-devoir1-jkoulei"
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