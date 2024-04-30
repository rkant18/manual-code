resource "azurerm_linux_virtual_machine" "lnx-vm" {
  for_each = var.linux-vm
  name = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  admin_username = each.value.admin
  network_interface_ids = [ data.azurerm_network_interface.nicdata[each.key].id, ]
  size = each.value.size
  os_disk {
        name = each.value.os_name
        storage_account_type = each.value.storage_account_type
        caching = each.value.caching
  }
    admin_ssh_key {
    username   = each.value.admin
    public_key           = file("~/.ssh/id_rsa.pub")
  }
   source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    version   = each.value.version
    sku       = each.value.sku
  }
}