terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "4fb69f8f-afe2-4799-8629-fd2ac4cbfbd6"
  tenant_id       = "4d0b0d71-57da-49bf-a6bf-dc7a98993e3d"
}
