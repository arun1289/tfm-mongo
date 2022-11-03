# The aws Project ID
variable "aws_project_id" {
  description = "The project id for the aws"
}

# The aws region
variable "aws_region" {
  description = "The region for the aws"
}

# The  public API key for MongoDB Atlas
variable "atlas_projectid" {
  description = "The private API key for MongoDB Atlas"
}
# Name of Cluster
variable "atlas_cluster_name" {
  description = "MongoDB Atlas DB atlas_cluster_name"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.atlas_cluster_name))
    error_message = "The Cluster Name must only contain numbers, hypens and alphabets in ##appid-appname-env## format."
  }
}
# Database Cluster Type 
variable "atlas_cluster_type" {
  description = "MongoDB Atlas DB atlas_cluster_type"
}
# The Atlas cloud provider_name
variable "atlas_provider_name" {
  description = "The Atlas cloud provider name"
  type        = string
  default     = "AWS"
}
# The Atlas cloud cluster disk_size
variable "disk_size_gb" {
  description = "The Atlas cloud provider disk size"
  type        = number
  default     = null
}

# The Atlas provider instance size name
variable "atlas_provider_instance_size_name" {
  description = "The Atlas provider instance size name"
  type        = string
  default     = "M10"
  validation {
    condition     = can(regex("^[M][1-8]0$", var.atlas_provider_instance_size_name))
    error_message = "The Max Instance Size can be only M80."
  }
}
# The Atlas Project Global cluster region1 
variable "cluster_provider_region" {
  description = "The Atlas Project cluster provider region"
  type        = string
  default     = "CENTRAL_US"
}
# The version of Mongodb 
variable "mongo_db_major_version" {
  description = "The MongoDB Version for cluster"
  type        = string
  default     = 5.0
}
# number of shards
variable "num_shards" {
  description = "MongoDB Atlas DB num_shards"
  type        = number
}
# Backup Enabled?
variable "cloud_backup" {
  description = "MongoDB Atlas DB provider_backup_enabled"
  type        = bool
  default     = true
}

#
# x509 Cert 
#

# Database user
variable "atlas_database_username" {
  description = "MongoDB Atlas DB username"
}
# Database role name
variable "atlas_database_role_name" {
  description = "MongoDB Atlas DB atlas_database_role_name"
  type        = string
  default     = "readWriteAnyDatabase"
}
# Database name
variable "atlas_database_name" {
  description = "MongoDB Atlas DB atlas_database_name"
  type        = string
  default     = "admin"
}
# Database authorization name 
variable "atlas_auth_database_name" {
  description = "MongoDB Atlas DB atlas_auth_database_name"
  type        = string
  default     = "$external"
}
# Database user scope
variable "atlas_database_user_scope" {
  description = "MongoDB Atlas DB atlas_database_user_scope"
  type        = string
  default     = "CLUSTER"
}
# Database user x509 type
variable "x509_type" {
  description = "MongoDB Atlas DB x509_type"
  type        = string
  default     = "MANAGED"
}
# Database user x509 label for key
variable "x509_key" {
  description = "MongoDB Atlas DB x509_key"
  type        = string
  default     = "My_key"
}
# Database user x509 label for value
variable "x509_value" {
  description = "MongoDB Atlas DB x509_value"
  type        = string
  default     = "My_key_value"
}
# Database user x509 months until expiration
variable "months_until_expiration" {
  description = "MongoDB Atlas DB months_until_expiration"
  type        = number
  default     = 12
}
# 
# Point in Time Enable
#

# Database Point in Time Enable
variable "pit_enabled" {
  description = "MongoDB Atlas DB pit_enabled"
  type        = bool
  default     = true
}
# The auto scaling option
variable "auto_scaling_disk_gb_enabled" {
  description = "Auto scaling option cluster"
  type        = bool
  default     = true
}
# Database auto_scaling_compute_enabled
variable "auto_scaling_compute_enabled" {
  description = "MongoDB Atlas DB auto_scaling_compute_enabled"
  type        = bool
  default     = false
}
# Database auto_scaling_compute_scale_down_enabled
variable "auto_scaling_compute_scale_down_enabled" {
  description = "MongoDB Atlas DB auto_scaling_compute_scale_down_enabled"
  type        = bool
  default     = false
}
# Database provider_auto_scaling_compute_max_instance_size
variable "provider_auto_scaling_compute_max_instance_size" {
  description = "MongoDB Atlas DB provider_auto_scaling_compute_max_instance_size"
  type        = string
  default     = null
}
# Database provider_auto_scaling_compute_min_instance_size
variable "provider_auto_scaling_compute_min_instance_size" {
  description = "MongoDB Atlas DB provider_auto_scaling_compute_min_instance_size"
  type        = string
  default     = null
}

#
# Backup Snapshot Policy
#

# Database reference_hour_of_day
variable "reference_hour_of_day" {
  description = "MongoDB Atlas Backup hour_of_day when Backup is defined to happen."
}
# Database reference_hour_of_day
variable "reference_minute_of_hour" {
  description = "MongoDB Atlas Backup minute of_hour when Backup is defined to happen."
}
# Database reference_hour_of_day
variable "restore_window_days" {
  description = "MongoDB Atlas Backup Restore Window."
}
# Database frequency_interval_1
variable "frequency_interval_1" {
  description = "MongoDB Atlas Backup Frequency Interval."
}
# Database frequency_interval_2
variable "frequency_interval_2" {
  description = "MongoDB Atlas Backup Frequency Interval."
}
# Database retention_unit
variable "retention_unit1" {
  description = "MongoDB Atlas Backup Retention Unit."
}
# Database retention_unit
variable "retention_unit2" {
  description = "MongoDB Atlas Backup Retention Unit."
}
# Database retention_value
variable "retention_value1" {
  description = "MongoDB Atlas Backup Retention Value."
  type        = number
  default     = 28
}
# Database retention_value
variable "retention_value2" {
  description = "MongoDB Atlas Backup Retention Value."
  type        = number
  default     = 28
}
# DBMonitoring Username
variable "username" {
  description = "MongoDB Atlas DB-Monitoring Username to get Alerts."
  default     = null
}

# Audit enabling variable
variable "audit_enabled" {
  description = "MongoDB Atlas DB audit enabled option"
  type        = bool
  default     = false
}
# Audit authorization value
variable "audit_authorization_success" {
  description = "MongoDB Atlas audit authorization"
  type        = bool
  default     = true
}


#Maintenance Window
variable "day_of_week" {
  description = "Day of the week when you would like the maintenance window to start "
  type        = number
  default     = null
}

variable "hour_of_day" {
  description = "Hour of the day when you would like the maintenance window to start."
  type        = number
  default     = null
}
///List of variables defined for the number of clusters
variable "cluster_info" {
  type        = list(any)
  description = "The list of Cluster Blocks required for Multi Regional deployment"
  default     = []
}

variable "electable_nodes" {
  description = "The Number of electable nodes"
  type        = number
  default     = null
}

variable "analytics_nodes" {
  description = "The Number of analytics nodes. Analytics nodes are read-only, and can never become the primary"
  type        = number
  default     = null
}

variable "priority" {
  description = "priority of nodes"
  type        = number
  default     = null
}

variable "region_name" {
  description = "region of nodes"
  type        = string
  default     = null
}

#Advanced Configuration Options
variable "oplog_size_mb" {
  description = "Atlas cluster oplog size"
  type        = number
  default     = null
}