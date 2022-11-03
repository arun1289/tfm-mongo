terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

# Create a Single/Multi-regional Cluster
resource "mongodbatlas_cluster" "my_cluster" {
  project_id                              = var.atlas_projectid
  name                                    = var.atlas_cluster_name
  auto_scaling_disk_gb_enabled            = var.auto_scaling_disk_gb_enabled
  disk_size_gb                            = var.disk_size_gb
  cloud_backup                            = var.cloud_backup
  cluster_type                            = var.atlas_cluster_type
  auto_scaling_compute_enabled            = var.auto_scaling_compute_enabled
  auto_scaling_compute_scale_down_enabled = var.auto_scaling_compute_scale_down_enabled
  mongo_db_major_version                  = var.mongo_db_major_version
  pit_enabled                             = var.pit_enabled
  num_shards                              = var.num_shards

  # Provider Settings "block"
  provider_name                                   = var.atlas_provider_name
  provider_instance_size_name                     = var.atlas_provider_instance_size_name
  provider_auto_scaling_compute_max_instance_size = var.provider_auto_scaling_compute_max_instance_size
  provider_auto_scaling_compute_min_instance_size = var.provider_auto_scaling_compute_min_instance_size
  replication_specs {
    num_shards = var.num_shards
    dynamic "regions_config" {
      for_each = var.cluster_info
      content {
        region_name     = regions_config.value.region_name
        electable_nodes = regions_config.value.electable_nodes
        analytics_nodes = regions_config.value.analytics_nodes
        priority        = regions_config.value.priority
      }
    }
  }

  # Advanced Configuration Options
  advanced_configuration {
    oplog_size_mb = var.oplog_size_mb
  }
}

#
# Create an Atlas Cluster Backup Policy
#
resource "mongodbatlas_cloud_backup_schedule" "my_backup" {
  project_id   = var.atlas_projectid
  cluster_name = mongodbatlas_cluster.my_cluster.name

  reference_hour_of_day    = var.reference_hour_of_day
  reference_minute_of_hour = var.reference_minute_of_hour
  restore_window_days      = var.restore_window_days

  // This will now add the desired policy items to the existing mongodbatlas_cloud_backup_schedule resource
  policy_item_hourly {
    frequency_interval = var.frequency_interval_1
    retention_unit     = var.retention_unit1
    retention_value    = var.retention_value1
  }
  policy_item_daily {
    frequency_interval = var.frequency_interval_2
    retention_unit     = var.retention_unit2
    retention_value    = var.retention_value2
  }
}
resource "mongodbatlas_database_user" "my_user" {
  username           = var.atlas_database_username
  x509_type          = var.x509_type
  project_id         = var.atlas_projectid
  auth_database_name = var.atlas_auth_database_name
  labels {
    key   = var.x509_key
    value = var.x509_value
  }
  roles {
    role_name     = var.atlas_database_role_name
    database_name = var.atlas_database_name
  }
  scopes {
    name = mongodbatlas_cluster.my_cluster.name
    type = var.atlas_database_user_scope
  }
}
resource "mongodbatlas_x509_authentication_database_user" "my_user" {
  project_id              = mongodbatlas_database_user.my_user.project_id
  username                = mongodbatlas_database_user.my_user.username
  months_until_expiration = var.months_until_expiration
}
//Auditing resource

resource "mongodbatlas_auditing" "my_auditing" {
  project_id                  = var.atlas_projectid
  audit_filter                = "{ 'atype': { '$in': [ 'authCheck', 'authenticate' ] }, 'param.command': { '$in': [ 'delete', 'findAndModify', 'insert', 'update', 'createCollection', 'createDatabase', 'createIndex', 'renameCollection', 'dropCollection', 'dropDatabase', 'dropIndex', 'createUser', 'dropUser', 'dropAllUsersFromDatabase', 'updateUser', 'grantRolesToUser', 'revokeRolesFromUser', 'createRole', 'updateRole', 'dropRole', 'dropAllRolesFromDatabase', 'grantRolesToRole', 'revokeRolesFromRole', 'grantPrivilegesToRole', 'revokePrivilegesFromRole', 'enableSharding', 'shardCollection', 'addShard', 'removeShard', 'shutdown', 'create', 'drop', 'rename', 'grant', 'revoke' ] }, 'param.ns': { '$nin': [ 'local.clustermanager', 'admin.system.users', 'admin.mms-automation', 'config.system.sessions' ] } } "
  audit_authorization_success = var.audit_authorization_success
  enabled                     = var.audit_enabled
}
#
# Maintenance Window
#
resource "mongodbatlas_maintenance_window" "maintenance_window" {
  project_id  = var.atlas_projectid
  day_of_week = var.day_of_week
  hour_of_day = var.hour_of_day
}

module "mongodbatlas-dbmonitoring" {
  source = "git@github.com:arun1289/tfm-dbmon-mongodb-atlas.git"
  // Name of the Atlas user to which to send notifications. 
  // Only a user in the project that owns the alert configuration is allowed here. 
  // Required for the USER notifications type
  username        = var.username
  atlas_projectid = var.atlas_projectid
}