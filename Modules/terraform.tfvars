module_infra = {
  rg1 = {
    rgname        = "innovent_dev_group"
    location      = "westus"
    vnetname      = "innovent_dev_vnet"
    address_space = ["192.168.0.0/16"]
  }
}
module_subnet = {
  Innovent_dev_subnet = {
    sub_name             = "innovent_dev_subnet"
    address_prefixes     = ["192.168.1.0/24"]
    virtual_network_name = "innovent_dev_vnet"
    resource_group_name  = "innovent_dev_group"
  }
  AzureBastionSubnet = {
    sub_name             = "AzureBastionSubnet"
    address_prefixes     = ["192.168.2.0/28"]
    virtual_network_name = "innovent_dev_vnet"
    resource_group_name  = "innovent_dev_group"
  }
}
module_nic = {
  nic1 = {
    nic_name                      = "nic-1"
    resource_group_name           = "innovent_dev_group"
    location                      = "westus"
    ip_con_name                   = "vm-net-nic-1"
    private_ip_address_allocation = "Dynamic"
    sub_name                      = "innovent_dev_subnet"
    vnetname                      = "innovent_dev_vnet"
  }
  nic2 = {
    nic_name                      = "nic-2"
    resource_group_name           = "innovent_dev_group"
    location                      = "westus"
    ip_con_name                   = "vm-net-nic-2"
    private_ip_address_allocation = "Dynamic"
    sub_name                      = "innovent_dev_subnet"
    vnetname                      = "innovent_dev_vnet"
  }
}
module_vm = {
  vm1 = {
    vm_name              = "innoventapp001"
    resource_group_name  = "innovent_dev_group"
    location             = "westus"
    admin                = "sysadmin"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    nic_name             = "nic-1"
    size                 = "Standard_F2"
    os_name              = "innoventapp001-os"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
  vm2 = {
    vm_name              = "innoventapp002"
    resource_group_name  = "innovent_dev_group"
    location             = "westus"
    admin                = "sysadmin"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    nic_name             = "nic-2"
    size                 = "Standard_F2"
    os_name              = "innoventapp002-os"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
}