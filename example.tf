module "mongodbatlas-test" {
  source                            = "git@github.com:arun1289/tfm-mongo.git" # Replace with ../../ once your main.tf template is configured. 
  aws_project_id                    = "xxxxxxxxxxxxxxxxxxx"              # aws project where the secrets are stored
  aws_region                        = "us-central1"                           # aws region where the keys are stored
  atlas_projectid                   = "60e5b2xxxxxxxxxxxxxxxxxx"              # Altas project ID
  atlas_cluster_name                = "53162-mdb-preprod"                     # <appid-app_acronym-env> Make sure to follow the standard to provision cluster
  atlas_cluster_type                = "REPLICASET"                            # Type of cluster provision
  atlas_provider_instance_size_name = "M10"                                   # Cluster size between M10 and M600
  num_shards                        = 1                                       # Number of shards for cluster provision
  disk_size_gb                      = 10                                      # Default Storage is 10 GB for M10, it varies per cluster tier size. Additional charges apply for more storage usage.
  #oplog_size_mb                     = "2048" #The custom oplog size of the cluster. By default oplog size calculated by Atlas as 5% of storage size.
  region_name_1     = "CENTRAL_US" # "CENTRAL_US" is default and highest priority region for Mongo
  electable_nodes_1 = 3            # The Number of Nodes between 2 Regions can be in a combination of 3, 5 or 7 Only. If Region 1 is having 2 Nodes, Then Region 2 can have either 1 or 3 or 5 which equals to 3, 5 or 7.

  region_name_2     = "US_EAST_4" # Example "US_EAST_4" as a second region
  electable_nodes_2 = 2           # The Number of Nodes between 2 Regions can be in a combination of 3, 5 or 7 Only. If Region 1 is having 2 Nodes, Then Region 2 can have either 1 or 3 or 5 which equals to 3, 5 or 7.

  username = "wiktor@coremont.com" # Atlas UI user account to receive alerts for cluster events

  auto_scaling_compute_enabled                    = true  # This is Optional, Additional Charges Apply
  auto_scaling_compute_scale_down_enabled         = true  # If auto_scaling_compute_enabled is "True" then, the parameter auto_scaling_compute_scale_down_enabled should be True.
  provider_auto_scaling_compute_max_instance_size = "M30" # If auto_scaling_compute_enabled is "True" then, Max Instance Size parameter must be set.
  provider_auto_scaling_compute_min_instance_size = "M10" # If auto_scaling_compute_enabled is "True" then, Min Instance Size parameter must be set.

  # Database User
  atlas_database_username = "appname-env" # Username to be assigned to create a readWriteAnydatabse user account certificate. Database User with X509 Certificate. All Applications should use only Certificate from applications for authentication to cluster.
  audit_enabled           = true          # default=true and if project is non-prod, set the value to false

  #Maintenance Window
  # *** It is recommended to activate maintenance mode and specify a time for the maintenance to occur. The default timezone is UTC***
  day_of_week = 7  #Day of the week when you would like the maintenance window to start as a 1-based integer: S=1, M=2, T=3, W=4, T=5, F=6, S=7.
  hour_of_day = 23 #Hour of the day when you would like the maintenance window to start. This parameter uses the 24-hour clock, where midnight is 0, noon is 12 (Time zone is UTC).

  #Backup Snapshot Policy 
  pit_enabled              = true # Default is True, If Non-Prod change it to false
  reference_hour_of_day    = 23   # Hour of the Day. Should be in 24 hours Format.
  reference_minute_of_hour = 00   # Minute when the backup should happen.
  restore_window_days      = 28   # Point in time restore, how far we can go back to restore the data (Enable Only for prod)

  # Backup Retention Policy Hourly&Daily
  frequency_interval_1 = 12     # This is the Frequency time interval how often the backup to be scheduled. Available frequency is Every 1, 2, 4, 6, 8 & 12 hours.
  retention_unit1      = "days" # This should be Days only.
  retention_value1     = 28     # Point in time restore, how far we can go back to restore the data (Enable Only for prod)
  frequency_interval_2 = 1      # This is the Frequency time interval how often the backup to be scheduled. Available frequency is only Daily (Default)
  retention_unit2      = "days" # This should be Days only.
  retention_value2     = 28     # Point in time restore, how far we can go back to restore the data (Enable Only for prod)
}