data "azurerm_network_interface" "nicdata" {
  for_each = var.linux-vm
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}