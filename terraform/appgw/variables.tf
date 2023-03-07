variable "region" {
  description = "Region of the resource group."
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_subnet_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "WAF_v2"
}

variable "backend_pool_name" {
  type = string
}

variable "backend_pool_ip_addresses" {
  type = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}