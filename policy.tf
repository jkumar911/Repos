resource "azapi_resource" "vaultedPolicy" {
  depends_on                = [azurerm_recovery_services_vault.vault]
  type                      = "Microsoft.RecoveryServices/vaults/backupPolicies@2025-08-01"
  for_each                  = { for vaulted_policy in var.vaulted_file_backup_policy : "${vaulted_policy.rsv_redundancy}-${vaulted_policy.rsvindex}" => vaulted_policy }
  name                      = each.value.vaulted_file_backup_policy_name
  parent_id                 = azurerm_recovery_services_vault.vault[each.key].id
  schema_validation_enabled = false

  body = {
    properties = {
      policyType           = "V2"
      timeZone             = "UTC"
      backupManagementType = "AzureStorage"
      workloadType         = "AzureFileShare"
      backup_tier          = "vault-standard"

      schedulePolicy = {
        schedulePolicyType      = "SimpleSchedulePolicy"
        scheduleRunFrequency    = each.value.schedule_frequency
        scheduleRunTimes        = each.value.run_time
        scheduleWeeklyFrequency = each.value.weekly_frequency
      }

      vaultRetentionPolicy = {
        snapshotRetentionInDays = each.value.snapshot_retention
        vaultRetention = {
          retentionPolicyType = "LongTermRetentionPolicy"
          dailySchedule = {
            retentionTimes = each.value.retention_time
            retentionDuration = {
              count        = each.value.retention_daily_count
              durationType = each.value.duration_days
            }
          }

          monthlySchedule = {
            retentionTimes = each.value.retention_time
            retentionDuration = {
              count        = each.value.retention_monthly_count
              durationType = each.value.duration_monthly
            }
            retentionScheduleFormatType = "Weekly"
            retentionScheduleWeekly = {
              daysOfTheWeek   = each.value.retention_weekly_day
              weeksOfTheMonth = each.value.retention_monthly_day
            }
            retentionScheduleDaily = var.ret_daily_sch
          }
          weeklySchedule = var.weekly_sch
          yearlySchedule = var.yearly_sch
        }
      }
    }
  }
}


