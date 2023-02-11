# Outputs the private IP addresses of the network interfaces created
output "private_ip" {
  value = [for i in range(var.vm_count): azurerm_network_interface.nic[i].private_ip_address]
  description = "The private IP addresses of the network interfaces"
}

# Outputs the IDs of the Linux virtual machines created
output "web_vm_ids" {
  value = azurerm_linux_virtual_machine.vm.*.id
  description = "The IDs of the Linux virtual machines"
}

# Outputs the name of the resource group where the Linux virtual machines are created
output "rg_name" {
  value = azurerm_resource_group.vm_rg.name
  description = "The name of the resource group where the Linux virtual machines are created"
}
