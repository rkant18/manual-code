resource "azurerm_virtual_network" "multi-vnet" {
  for_each = var.azurerm_virtual_network
  name = each.value.vnetname
  resource_group_name = each.value.rgname
  address_space = each.value.address_space
  location = each.value.location
}