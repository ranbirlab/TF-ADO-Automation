variable "capability" {
  type        = string
  description = "The capability for the deployment"
}

variable "admin_password" {
  type        = string
  default     = "Azurepassword@12345"
  description = "The password for the admin account"
}

variable "environment" {
  type        = string
  description = "The environment for the deployment"
}

variable "appname" {
  type        = string
  description = "The app name for the deployment"
}

variable "web_tier" {
  type        = object({
    count = number
    recommended_instance_type = string
    marketplace_image = object({
      publisher = string
      offer = string
      sku = string
      version = string
    })
  })
  description = "The web tier configuration, including the number of instances, the recommended instance type, and the marketplace image details (publisher, offer, SKU, and version)"
}

variable "vnet_map" {
  type        = map(string)
  default     = {
    "tax:dev" :"TAX-DEV-VNET",
    "tax:uat" :"TAX-UAT-VNET",
    "tax:prod":"TAX-PROD-VNET"
  }
  description = "A map of capability and environment to the virtual network name, where the keys are in the format of 'capability:environment'"
}

variable "vnet_rg_map" {
  type        = map(string)
  default     = {
    "tax:dev" :"TAX-DEV-NETWORK-RG",
    "tax:uat" :"TAX-UAT-NETWORK-RG",
    "tax:prod":"TAX-PROD-NETWORK-RG"
  }
  description = "A map of capability and environment to the virtual network resource group, where the keys are in the format of 'capability:environment'"
}

variable "subnet_map" {
  type        = map(string)
  default     = {
    "tax:dev:web" : "TAX-DEV-WEB-SUBNET",
    "tax:uat:web" : "TAX-UAT-WEB-SUBNET",
    "tax:prod:web": "TAX-PROD-WEB-SUBNET"
  }
  description = "A map of capability, environment, and tier to the subnet name, where the keys are in the format of 'capability:environment:tier'"
}
