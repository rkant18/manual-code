# resource "azurerm_resource_group" "multi-rg" {
#   name     = "innovent_dev_group"
#   location = "westus"
# }
# data "azurerm_resource_group" "rg" {
#   name     = "innovent_dev_group"
# }
# data "azurerm_client_config" "current" {
# }
# resource "azurerm_user_assigned_identity" "user_identity" {
#   name                = "sysadmin"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

# resource "azurerm_storage_account" "storageAcc" {
#   name                     = "innoventstg01"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_mssql_server" "sqlserver" {
#   name                         = "innovent-sqlserver"
#   resource_group_name          = data.azurerm_resource_group.rg.name
#   location                     = data.azurerm_resource_group.rg.location
#   version                      = "12.0"
#   administrator_login          = "dbadmin"
#   administrator_login_password = "4-v3ry-53cr37-p455w0rd"
# }

# resource "azurerm_mssql_database" "mysqlapp" {
#   name           = "inno-db"
#   server_id      = azurerm_mssql_server.sqlserver.id
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   # license_type   = "LicenseIncluded"
#   #max_size_gb    = 8
#   # read_scale     = 
#   sku_name       = "S0"
#   zone_redundant = false
#   enclave_type   = "VBS"

#   tags = {
#     foo = "bar"
#   }

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.user_identity.id,]
#   }
# }
#   transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.vault_key.id

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# # Create a key vault with access policies which allow for the current user to get, list, create, delete, update, recover, purge and getRotationPolicy for the key vault key and also add a key vault access policy for the Microsoft Sql Server instance User Managed Identity to get, wrap, and unwrap key(s)
# resource "azurerm_key_vault" "inno-key" {
#   name                        = "mssqltde"
#   location                    = data.azurerm_resource_group.rg.location
#   resource_group_name         = data.azurerm_resource_group.rg.name
#   enabled_for_disk_encryption = true
#   tenant_id                   = azurerm_user_assigned_identity.user_identity.id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = true

#   sku_name = "standard"


#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = ["Get", "List", "Create", "Delete", "Update", "Recover", "Purge", "GetRotationPolicy"]
#   }

#   access_policy {
#     tenant_id = azurerm_user_assigned_identity.user_identity.tenant_id
#     object_id = azurerm_user_assigned_identity.user_identity.principal_id

#     key_permissions = ["Get", "WrapKey", "UnwrapKey"]
#   }
# }

# resource "azurerm_key_vault_key" "vault_key" {
#   depends_on = [azurerm_key_vault.inno-key]

#   name         = "example-key"
#   key_vault_id = azurerm_key_vault.inno-key.id
#   key_type     = "RSA"
#   key_size     = 2048

#   key_opts = ["unwrapKey", "wrapKey"]
# }