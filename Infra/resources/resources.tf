resource "azurerm_resource_group" "multi-rg" {
  for_each = var.resource
  name = each.value.rgname
  location = each.value.location
}