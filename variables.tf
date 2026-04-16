variable "recovery_services_vault" {
  type = list(object({
    rsv_redundancy = string
    rsvindex       = string
    sku            = string

  }))
  default = [{
    rsv_redundancy = "LocallyRedundant"
    rsvindex       = "01"
    sku            = "Standard"

    },
    {
      rsv_redundancy = "ZoneRedundant"
      rsvindex       = "01"
      sku            = "Standard"


    },
    {
      rsv_redundancy = "GeoRedundant"
      rsvindex       = "01"
      sku            = "Standard"

  }]
}


variable "vaulted_file_backup_policy" {
  type = list(object({
    rsv_name                        = string
    vaulted_file_backup_policy_name = string
    schedule_frequency              = string
    run_time                        = list(string)
    weekly_frequency                = number
    snapshot_retention              = number
    retention_time                  = list(string)
    retention_daily_count           = number
    duration_days                   = string
    retention_monthly_count         = number
    duration_monthly                = string
    retention_weekly_day            = list(string)
    retention_monthly_day           = list(string)
    rsv_redundancy                  = string
    rsvindex                        = string
    policy_type                     = string
  }))
  default = [{
    rsv_name                        = "RSV-LRS-01"
    rsv_redundancy                  = "LocallyRedundant"
    rsvindex                        = "01"
    policy_type              = "V2"
    vaulted_file_backup_policy_name = "BP050"
    schedule_frequency              = "Daily"
    run_time                        = ["2026-02-13T23:00:00Z"]
    weekly_frequency                = 0
    snapshot_retention              = 2
    retention_time                  = ["2026-02-13T23:00:00Z"]
    retention_daily_count           = 7
    duration_days                   = "Days"
    retention_monthly_count         = 3
    duration_monthly                = "Months"
    retention_weekly_day            = ["Sunday"]
    retention_monthly_day           = ["Last"]
    },
    {
      rsv_name                        = "RSV-ZRS-01"
      rsv_redundancy                  = "ZoneRedundant"
      rsvindex                        = "01"
      policy_type    = "V2"
      vaulted_file_backup_policy_name = "BP050"
      schedule_frequency              = "Daily"
      run_time                        = ["2026-02-13T23:00:00Z"]
      weekly_frequency                = 0
      snapshot_retention              = 2
      retention_time                  = ["2026-02-13T23:00:00Z"]
      retention_daily_count           = 7
      duration_days                   = "Days"
      retention_monthly_count         = 3
      duration_monthly                = "Months"
      retention_weekly_day            = ["Sunday"]
      retention_monthly_day           = ["Last"]
    },
    {
      rsv_name                        = "RSV-GRS-01"
      rsv_redundancy                  = "GeoRedundant"
      rsvindex                        = "01"
      policy_type    = "V2"
      vaulted_file_backup_policy_name = "BP050"
      schedule_frequency              = "Daily"
      run_time                        = ["2026-02-13T20:00:00Z"]
      weekly_frequency                = 0
      snapshot_retention              = 2
      retention_time                  = ["2026-02-13T20:00:00Z"]
      retention_daily_count           = 7
      duration_days                   = "Days"
      retention_monthly_count         = 3
      duration_monthly                = "Months"
      retention_weekly_day            = ["Sunday"]
      retention_monthly_day           = ["Last"]
  }]
}

variable "backup_policy_vmdly" {
  type = list(object({
    rsv_name                       = string
    backup_policy_vmdly_name       = string
    schedule_frequency             = string
    run_time                       = string
    instant_restore_retention_days = number
    retention_daily_count          = number
    retention_monthly_count        = number
    retention_monthly_day          = list(string)
    retention_monthly_week         = list(string)
  }))
  default = [{
    rsv_name                       = "RSV-LRS-01"
    backup_policy_vmdly_name       = "BPDAILY01"
    instant_restore_retention_days = 3
    schedule_frequency             = "Daily"
    run_time                       = "10:00" # Time in HH:mm format
    retention_daily_count          = 7
    retention_monthly_count        = 3
    retention_monthly_day          = ["Sunday"]
    retention_monthly_week         = ["First"]
    },
    {
      rsv_name                       = "RSV-ZRS-01"
      backup_policy_vmdly_name       = "BPDAILY01"
      instant_restore_retention_days = 3
      schedule_frequency             = "Daily"
      run_time                       = "10:00" # Time in HH:mm format
      retention_daily_count          = 7
      retention_monthly_count        = 3
      retention_monthly_day          = ["Sunday"]
      retention_monthly_week         = ["First"]
    },
    {
      rsv_name                       = "RSV-GRS-01"
      backup_policy_vmdly_name       = "BPDAILY01"
      instant_restore_retention_days = 3
      schedule_frequency             = "Daily"
      run_time                       = "10:00" # Time in HH:mm format
      retention_daily_count          = 7
      retention_monthly_count        = 3
      retention_monthly_day          = ["Sunday"]
      retention_monthly_week         = ["First"]
  }]
}

variable "backup_policy_vmhrly" {
  type = list(object({
    rsv_name                       = string
    backup_policy_vmhrly_name      = string
    backup_frequency               = string
    backup_time                    = string
    backup_hour_interval           = number
    backup_hour_duration           = number
    instant_restore_retention_days = number
    retention_daily_count          = number
    retention_monthly_count        = number
    retention_monthly_week         = list(string)
    retention_monthly_weekdays     = list(string)
  }))
  default = [{
    rsv_name                       = "RSV-LRS-01"
    backup_policy_vmhrly_name      = "BPHOURLY01"
    backup_frequency               = "Hourly"
    backup_time                    = "08:00" # Time in HH:mm format
    backup_hour_interval           = 4
    backup_hour_duration           = 24
    instant_restore_retention_days = 2
    retention_daily_count          = 7
    retention_monthly_count        = 3
    retention_monthly_week         = ["First"]
    retention_monthly_weekdays     = ["Sunday"]
    },
    {
      rsv_name                       = "RSV-ZRS-01"
      backup_policy_vmhrly_name      = "BPHOURLY01"
      backup_frequency               = "Hourly"
      backup_time                    = "08:00" # Time in HH:mm format
      backup_hour_interval           = 4
      backup_hour_duration           = 24
      instant_restore_retention_days = 2
      retention_daily_count          = 7
      retention_monthly_count        = 3
      retention_monthly_week         = ["First"]
      retention_monthly_weekdays     = ["Sunday"]
    },
    {
      rsv_name                       = "RSV-GRS-01"
      backup_policy_vmhrly_name      = "BPHOURLY01"
      backup_frequency               = "Hourly"
      backup_time                    = "10:00" # Time in HH:mm format
      backup_hour_interval           = 4
      backup_hour_duration           = 24
      instant_restore_retention_days = 2
      retention_daily_count          = 7
      retention_monthly_count        = 3
      retention_monthly_week         = ["First"]
      retention_monthly_weekdays     = ["Sunday"]
  }]
}

variable "ret_daily_sch" {
  type    = string
  default = null
}

variable "weekly_sch" {
  type    = string
  default = null
}

variable "yearly_sch" {
  type    = string
  default = null
}

variable "timezone" {
  type    = string
  default = "UTC"
}
