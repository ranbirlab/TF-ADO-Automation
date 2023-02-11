module "web_tier" {
  source = "../../module/web-infra"

  # The capability for the deployment
  capability = var.capability

  # The environment for the deployment
  environment = var.environment

  # The name of the application
  appname = var.appname

  # The web tier details
  web_tier = var.web_tier

  # The name of the virtual network
  vnet_name = var.vnet_map["${var.capability}:${var.environment}"]

  # The resource group name of the virtual network
  vnet_rg = lookup(var.vnet_rg_map, "${var.capability}:${var.environment}")

  # The name of the subnet
  sub_name = lookup(var.subnet_map, "${var.capability}:${var.environment}:web")

  # The number of virtual machines
  vm_count = var.web_tier.count

  # The size of the virtual machine
  vm_size = var.web_tier.recommended_instance_type

  # The name of the virtual machine
  vm_name = format("%s-%s-%s-web", var.capability, var.appname, var.environment)

  # The name of the resource group
  rg_name = format("%s-%s-%s-web-rg", var.capability, var.appname, var.environment)

  # The publisher of the marketplace image
  publisher = var.web_tier.marketplace_image.publisher

  # The offer of the marketplace image
  offer = var.web_tier.marketplace_image.offer

  # The SKU of the marketplace image
  sku = var.web_tier.marketplace_image.sku

  # The version of the marketplace image
  image_version = var.web_tier.marketplace_image.version

  # The password for the admin account
  admin_password = var.admin_password
}
