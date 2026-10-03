resource "azurerm_subnet" "cr460_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.cr460.name
  virtual_network_name = azurerm_virtual_network.cr460_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "cr460_nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.cr460.location
  resource_group_name = azurerm_resource_group.cr460.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.cr460_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    Projet = "DevoirCR460"
  }
}

resource "azurerm_linux_virtual_machine" "cr460_vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.cr460.name
  location            = azurerm_resource_group.cr460.location
  size                = var.vm_size

  admin_username                  = "azureuser"
  admin_password                  = data.azurerm_key_vault_secret.cr460_vm_password.value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.cr460_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-arm64"
    version   = "latest"
  }

  tags = {
    Projet = "DevoirCR460"
  }
}

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.cr460_vm.name
}