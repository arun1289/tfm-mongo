# Use terraform output to display connection strings.
output "connection_strings" {
  value = "mongodbatlas_cluster.Cluster_name.connection_strings"
}
output "atlas_cluster_name" {
  value       = mongodbatlas_cluster.my_cluster.name
  description = "The Cluster name for the Mongo Atlas instance."
}
output "cluster_id" {
  value       = mongodbatlas_cluster.my_cluster.cluster_id
  description = "The Cluster ID for the Mongo Atlas instance."
}
output "atlas_cluster_type" {
  value       = mongodbatlas_cluster.my_cluster.cluster_type
  description = "The Cluster Type for the Mongo Atlas instance."
}
output "provider_region_name" {
  value       = mongodbatlas_cluster.my_cluster.provider_region_name
  description = "The Cluster Region for the Mongo Atlas instance."
}
output "provider_instance_size_name" {
  value       = mongodbatlas_cluster.my_cluster.provider_instance_size_name
  description = "The Cluster Size for the Mongo Atlas instance."
}
output "disk_size_gb" {
  value       = mongodbatlas_cluster.my_cluster.disk_size_gb
  description = "The Disk Size for the Mongo Atlas Cluster"
}
output "mongo_db_major_version" {
  value       = mongodbatlas_cluster.my_cluster.mongo_db_major_version
  description = "The Mongo DB Major Version for the Mongo Atlas instance."
}
output "standard_uri" {
  value       = mongodbatlas_cluster.my_cluster.connection_strings.0.standard
  description = "The Cluster name for the Mongo Atlas instance."
}
output "standard_srv" {
  value       = mongodbatlas_cluster.my_cluster.connection_strings.0.standard_srv
  description = "The Cluster standard srv uri for the Mongo Atlas instance."
}
output "private" {
  value       = mongodbatlas_cluster.my_cluster.connection_strings[0].private
  description = "The Private connection string for the Mongo Atlas instance."
}
output "private_srv" {
  value       = mongodbatlas_cluster.my_cluster.connection_strings[0].private_srv
  description = "The Private Connection srv uri for the Mongo Atlas instance."
}
output "mongo_uri" {
  value       = mongodbatlas_cluster.my_cluster.mongo_uri
  description = "The Cluster mongo_uri for the Mongo Atlas instance."
}
output "mongo_uri_with_options" {
  value       = mongodbatlas_cluster.my_cluster.mongo_uri_with_options
  description = "The Cluster mongo_uri_with_options for the Mongo Atlas instance."
}
output "pit_enabled" {
  value       = mongodbatlas_cluster.my_cluster.pit_enabled
  description = "The Point in Time Backup Enabled for the Mongo Atlas instance."
}
output "provider_backup_enabled" {
  value       = mongodbatlas_cluster.my_cluster.provider_backup_enabled
  description = "The The Provider Backup Enabled for the Mongo Atlas instance."
}
output "auto_scaling_compute_enabled" {
  value       = mongodbatlas_cluster.my_cluster.auto_scaling_compute_enabled
  description = "The Provider Auto Scaling for the Mongo Atlas instance."
}
output "auto_scaling_compute_scale_down_enabled" {
  value       = mongodbatlas_cluster.my_cluster.auto_scaling_compute_scale_down_enabled
  description = "The Provider Scale Down for the Mongo Atlas instance."
}
output "provider_auto_scaling_compute_max_instance_size" {
  value       = mongodbatlas_cluster.my_cluster.provider_auto_scaling_compute_max_instance_size
  description = "The Provider Autoscaling Max Instance Size."
}
output "provider_auto_scaling_compute_min_instance_size" {
  value       = mongodbatlas_cluster.my_cluster.provider_auto_scaling_compute_min_instance_size
  description = "The Provider Autoscaling Min Instance Size."
}
output "num_shards" {
  value       = mongodbatlas_cluster.my_cluster.num_shards
  description = "The Number of Shards assigned for the Mongo Atlas instance."
}
output "database_user" {
  value       = mongodbatlas_database_user.my_user.username
  description = "The Cluster Database User for the Mongo Atlas instance."
}
output "database_name" {
  value       = var.atlas_database_name
  description = "The Database Name assigned to Database in the Mongo Atlas instance."
}
output "current_certificate" {
  value       = mongodbatlas_x509_authentication_database_user.my_user.current_certificate
  description = "The Cluster Database User x509 certificate Key for the Mongo Atlas instance."
  sensitive   = true
}
output "reference_hour_of_day" {
  value       = var.reference_hour_of_day
  description = "The hour of the day when Backup is scheduled."
}
output "reference_minute_of_hour" {
  value       = var.reference_minute_of_hour
  description = "The minute of the hour when Backup is scheduled."
}
output "restore_window_days" {
  value       = var.restore_window_days
  description = "The restore day set for the Backup scheduled."
}
output "frequency_interval_1" {
  value       = var.frequency_interval_1
  description = "The Frequency interval for hourly backup snaphot.."
}
output "frequency_interval_2" {
  value       = var.frequency_interval_2
  description = "The Frequency interval for daily backup snaphot.."
}
output "retention_value1" {
  value       = var.retention_value1
  description = "The Number of days a backup retention to be set for hourly backup."
}
output "retention_value2" {
  value       = var.retention_value2
  description = "The Number of days a backup retention to be set for daily backup."
}
output "retention_unit1" {
  value       = var.retention_unit1
  description = "Retention unit for backup snapshot schedule for hourly backup."
}
output "retention_unit2" {
  value       = var.retention_unit2
  description = "Retention unit for backup snapshot schedule for daily backup."
}
output "audit_enabled" {
  value       = var.audit_enabled
  description = "Audit enabled option for mongoAtlas."
}
output "day_of_week" {
  value       = var.day_of_week
  description = "Day of the week when you would like the maintenance window to start "
}
output "hour_of_day" {
  value       = var.hour_of_day
  description = "Hour of the day when you would like the maintenance window to start."
}
output "oplog_size_mb" {
  value       = var.oplog_size_mb
  description = "Atlas cluster oplog size."
}