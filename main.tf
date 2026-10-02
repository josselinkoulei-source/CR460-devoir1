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