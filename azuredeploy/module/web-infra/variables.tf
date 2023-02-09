variable "vnet_rg" {
  type        = string
  description = "The name of the resource group that contains the virtual network"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "sub_name" {
  type        = string
  description = "The name of the subnet within the virtual network"
}

variable "vm_name" {
  type        = string
  description = "The name of the web tier virtual machines"
}

variable "vm_count" {
  type        = number
  description = "The number of web tier virtual machines to create"
}

variable "vm_size" {
  type        = string
  description = "The size of the web tier virtual machines"
}

variable "admin_user" {
  type        = string
  default     = "kpmgadmin"
  description = "The administrator username for the virtual machines"
}

variable "admin_password" {
  type        = string
  default     = "Azurepassword@12345"
  description = "The administrator password for the virtual machines"
}

variable "publisher" {
  type        = string
  description = "The publisher of the marketplace image for the virtual machines"
}

variable "offer" {
  type        = string
  description = "The offer of the marketplace image for the virtual machines"
}

variable "sku" {
  type        = string
  description = "The sku of the marketplace image for the virtual machines"
}

variable "image_version" {
  type        = string
  description = "The version of the marketplace image for the virtual machines"
}

variable "location" {
  type        = string
  default     = "UK South"
  description = "The location where the virtual machines and resources will be created"
}

variable "capability" {
  type        = string
  description = "The capability of the environment"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group for the web tier virtual machines"
}

variable "environment" {
  type        = string
  description = "The environment for the virtual machines and resources"
}

variable "appname" {
  type        = string
  description = "The name of the application"
}

variable "web_tier" {
  type        = object({
    count = number,
    recommended_instance_type = string,
    marketplace_image = object({
      publisher = string,
      offer = string,
      sku = string,
      version = string
    })
  })
  description = "An object that contains the configuration for the web tier virtual machines and resources"
}
