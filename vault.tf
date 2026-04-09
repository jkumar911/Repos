resource "azurerm_recovery_services_vault" "vault" {
  for_each      	= { for vault in var.recovery_services_vault : "${vault.rsv_redundancy}-${vault.rsvindex}" => vault }
  name                  = "RSV-${substr(each.value.rsv_redundancy, 0, 1)}RS-${each.value.rsvindex}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  sku                   = "Standard"
}

