# Get a VNet RG
data "azurerm_resource_group" "vnetrg" {
  name = var.vnet_rg

  # The name of the resource group that contains the Virtual Network (VNet)
  # This data source is used to retrieve information about an existing resource group
}

# Get a virtual network within the resource group
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnetrg.name

  # The name of the Virtual Network (VNet)
  # This data source is used to retrieve information about an existing Virtual Network (VNet)
}

# Get the subnet in the VNET
data "azurerm_subnet" "subnet" {
  name                 = var.sub_name
  resource_group_name  = data.azurerm_resource_group.vnetrg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name

  # The name of the subnet in the Virtual Network (VNet)
  # This data source is used to retrieve information about an existing subnet in the Virtual Network (VNet)
}

# Create a RG for Azure VM
resource "azurerm_resource_group" "vm_rg" {
  name     = var.rg_name
  location = var.location

  # The name of the resource group for the Azure virtual machine (VM)
  # The location of the resource group for the Azure virtual machine (VM)
}

# Create a new NIC using existing manual VNET & Subnet
resource "azurerm_network_interface" "nic" {
  count            = var.vm_count
  name             = "${var.vm_name}-nic-${count.index}"
  location         = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  # The number of network interfaces to create
  # The name of the network interface
  # The location of the network interface
  # The resource group name for the network interface

  ip_configuration {
    name                      = "internal"
    subnet_id                 = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"

    # The name of the IP configuration
    # The ID of the subnet
    # The private IP address allocation method
  }
}

# Create a new Azure VM using existing manual VNET & Subnet & in a VM RG
resource "azurerm_linux_virtual_machine" "vm" {
  name                        = "${var.vm_name}-vm-${count.index}"
  count                       = var.vm_count 
  resource_group_name         = azurerm_resource_group.vm_rg.name
  location                    = azurerm_resource_group.vm_rg.location
  size                        = var.vm_size 
  admin_username              = var.admin_user 
  admin_password              = var.admin_password 
  disable_password_authentication = false
  # Assign the NIC created in the previous step to the VM
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]
# Specify the disk configuration for the VM's operating system
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
# Specify the source image to be used to create the VM
  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }
}
