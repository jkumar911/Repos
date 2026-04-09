resource "azurerm_backup_policy_vm" "vmdaily" {
  depends_on = [ azurerm_recovery_services_vault.vault]
  for_each = { for vmpolicy in var.backup_policy_vmdly : "${vmpolicy.rsv_name}-${vmpolicy.backup_policy_vmdly_name}" => vmpolicy }
  name                = each.value.backup_policy_vmdly_name
  resource_group_name = azurerm_resource_group.rg.name
  recovery_vault_name = each.value.rsv_name
  timezone = "UTC"
  instant_restore_retention_days = each.value

  backup {
    frequency = each.value.schedule_frequency
    time      = each.value.run_time
  }

  retention_daily {
    count = each.value.retention_daily_count
  }

  retention_monthly {
    count     = each.value.retention_monthly_count
    weekdays  = each.value.retention_monthly_day
    weeks     = each.value.retention_monthly_week
  }

  policy_type = "V2"
}