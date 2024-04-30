data "azurerm_subnet" "data-subnet" {
  for_each = var.nic
  name = each.value.sub_name
  virtual_network_name = each.value.vnetname
  resource_group_name = each.value.resource_group_name
}