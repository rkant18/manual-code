module_infra = {
    rg1 = {
        rgname = "innovent_dev_group"
        location = "westus"
        vnetname = "innovent_dev_vnet"
        address_space = ["192.168.0.0/16"]
    } 
}
module_subnet = {
        Innovent_dev_subnet = {
            sub_name = "innovent_dev_subnet"
            address_prefixes = ["192.168.1.0/24"]
            virtual_network_name = "innovent_dev_vnet"
            resource_group_name = "innovent_dev_group"
        }
        AzureBastionSubnet = {
            sub_name = "AzureBastionSubnet"
            address_prefixes = ["192.168.2.0/28"]
            virtual_network_name = "innovent_dev_vnet"
            resource_group_name = "innovent_dev_group"
        }
        }
      
