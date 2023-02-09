#The name of the virtual network.
output "vnet_name" {
  value = var.vnet_map["${var.capability}:${var.environment}"]
  description = "The name of the virtual network"
}

#The name of the resource group that contains the virtual network.
output "vnet_rg" {
  value = lookup(var.vnet_rg_map, "${var.capability}:${var.environment}")
  description = "The name of the resource group that contains the virtual network"
}

#The name of the subnet within the virtual network
output "subnet_name" {
  value = lookup(var.subnet_map, "${var.capability}:${var.environment}:web")
  description = "The name of the subnet within the virtual network"
}

#The name of the resource group for the web tier virtual machines
output "rg_name" {
  value = format("%s-%s-%s-web-rg", var.capability, var.appname, var.environment)
  description = "The name of the resource group for the web tier virtual machines"
}

#The name of the web tier virtual machines
output "vm_name" {
  value = format("%s-%s-%s-web", var.capability, var.appname, var.environment)
  description = "The name of the web tier virtual machines"
}
