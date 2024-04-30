### To create new resource group in Infra"
module "rg" {
  source   = "github.com/rkant18/manual-code.git/Infra/resources"
  resource = var.module_infra
}

### To create new virtual Network in Infra
module "vnet" {
  depends_on              = [module.rg]
  source                  = "github.com/rkant18/manual-code.git/Infra/vnet"
  azurerm_virtual_network = var.module_infra

}
### To create new subnet for virual network to use in resources
module "subnet" {
  depends_on = [module.vnet]
  source     = "github.com/rkant18/manual-code.git/Infra/subnet"
  subnet     = var.module_subnet
}

### To create new network interface cards for VM use
module "nic" {
  depends_on = [module.subnet]
  source     = "../Infra/interface"
  nic        = var.module_nic

}
#### TO create Linux vm 
module "lnx-vm" {
  source   = "../Infra/vm-linux-instance"
  linux-vm = var.module_vm
}
#### TO create sql-db server and database 
module "sqlserver" {
  source = "../Infra/sqldb"
}