resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region

  tags      = var.tags
}

module "network" {
  source = "../../../terraform-modules-azure/network/vnet/"

  region              = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.vnet_name
  address_spaces      = var.vnet_address_spaces
  subnets             = var.vnet_subnets

  tags                = var.tags
}