resource "azurerm_backup_policy_vm" "vmhourly" {
    depends_on = [azurerm_recovery_services_vault.vault]
    for_each   = { for vmhrpolicy in var.backup_policy_vmhrly : "${vmhrpolicy.rsv_name}-${vmhrpolicy.backup_policy_vmhrly_name}" => vmhrpolicy }
    name       = each.value.backup_policy_vmhrly_name    
    resource_group_name = azurerm_resource_group.rg.name
    recovery_vault_name = each.value.rsv_name
    timezone = "UTC"
    instant_restore_retention_days = each.value.instant_restore_retention_days

    backup {
        frequency     = each.value.backup_frequency
        time          = each.value.backup_time
        hour_interval = each.value.backup_hour_interval
        hour_duration = each.value.backup_hour_duration
    }

    retention_daily {
        count = each.value.retention_daily_count
    }

    retention_monthly {
        count    = each.value.retention_monthly_count
        weekdays = each.value.retention_monthly_weekdays
        weeks     = each.value.retention_monthly_week
    }

    policy_type = "V2"

}