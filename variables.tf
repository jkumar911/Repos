variable "recovery_services_vault" {
  type = list(object({
    rsv_redundancy = string
    rsvindex       = string

  }))
  default = [{
    rsv_redundancy	= "LocallyRedundant"
    rsvindex		= "01"
    
    },
    {
      rsv_redundancy	= "ZoneRedundant"
      rsvindex		= "01"

    },
    {
      rsv_redundancy	= "GeoRedundant"
      rsvindex		= "01"
   
  }]
}


variable "vaulted_file_backup_policy" {
  type = list(object({
    rsv_name	                      = string
    vaulted_file_backup_policy_name = string
    schedule_frequency		          = string
    run_time                        = list(string)
    weekly_frequency		            = number
    snapshot_retention              = number
    retention_time		              = list(string)
    retention_daily_count	          = number
    duration_days                   = string
    retention_monthly_count         = number
    duration_monthly                = string
    retention_weekly_day            = list(string)
    retention_monthly_day           = list(string)
    rsv_redundancy		              = string
    rsvindex                        = string
  }))
  default = [{
    rsv_name			                  = "RSV-LRS-01"
    rsv_redundancy                  = "LocallyRedundant"
    rsvindex			                  = "01"
    vaulted_file_backup_policy_name = "BP050"
    schedule_frequency		          = "Daily"
    run_time                        = ["2026-02-13T23:00:00Z"]
    weekly_frequency		            = 0
    snapshot_retention              = 2
    retention_time		              = ["2026-02-13T23:00:00Z"]
    retention_daily_count	          = 7
    duration_days                   = "Days"
    retention_monthly_count         = 3
    duration_monthly                = "Months"
    retention_weekly_day            = ["Sunday"]
    retention_monthly_day           = ["Last"]
    },
    {
      rsv_name			                  = "RSV-ZRS-01"
      rsv_redundancy		              = "ZoneRedundant"
      rsvindex			                  = "01"
      vaulted_file_backup_policy_name = "BP050"
      schedule_frequency	            = "Daily"
      run_time                        = ["2026-02-13T23:00:00Z"]
      weekly_frequency		            = 0
      snapshot_retention              = 2
      retention_time		              = ["2026-02-13T23:00:00Z"]
      retention_daily_count	          = 7
      duration_days                   = "Days"
      retention_monthly_count         = 3
      duration_monthly                = "Months"
      retention_weekly_day            = ["Sunday"]
      retention_monthly_day           = ["Last"]
    },
    {
      rsv_name			                  = "RSV-GRS-01"
      rsv_redundancy		              = "GeoRedundant"
      rsvindex			                  = "01"
      vaulted_file_backup_policy_name = "BP050"
      schedule_frequency	            = "Daily"
      run_time                        = ["2026-02-13T20:00:00Z"]
      weekly_frequency		            = 0
      snapshot_retention              = 2
      retention_time		              = ["2026-02-13T20:00:00Z"]
      retention_daily_count	          = 7
      duration_days                   = "Days"
      retention_monthly_count         = 3
      duration_monthly                = "Months"
      retention_weekly_day            = ["Sunday"]
      retention_monthly_day           = ["Last"]
    }]
}

variable "backup_policy_vmdly" {
  type = list(object({
    rsv_name                = string
    backup_policy_vmdly     = string
    schedule_frequency      = string
    run_time                = list(string)
    retention_daily_count   = number
    retention_monthly_count = number
    retention_monthly_day   = list(string)
    retention_monthly_week  = list(string)
  }))
  default = [ {
    rsv_name                = "RSV-LRS-01"
    backup_policy_vmdly     = "BPDAILY01"
    schedule_frequency      = "Daily"
    run_time                = [ "2026-04-09T10:00:00Z" ]
    retention_daily_count   = 7
    retention_monthly_count = 3
    retention_monthly_day   = [ "Sunday" ]
    retention_monthly_week  = [ "First" ]
  },
{
    rsv_name                = "RSV-ZRS-01"
    backup_policy_vmdly     = "BPDAILY01"
    schedule_frequency      = "Daily"
    run_time                = [ "2026-04-09T10:00:00Z" ]
    retention_daily_count   = 7
    retention_monthly_count = 3
    retention_monthly_day   = [ "Sunday" ]
    retention_monthly_week  = [ "First" ]
  },
{
    rsv_name                = "RSV-GRS-01"
    backup_policy_vmdly     = "BPDAILY01"
    schedule_frequency      = "Daily"
    run_time                = [ "2026-04-09T10:00:00Z" ]
    retention_daily_count   = 7
    retention_monthly_count = 3
    retention_monthly_day   = [ "Sunday" ]
    retention_monthly_week  = [ "First" ]
  } ]
}

variable "ret_daily_sch" {
  type		= string
  default	= null
}

variable "weekly_sch" {
  type		= string
  default	= null
}

variable "yearly_sch" {
  type		= string
  default	= null
}

