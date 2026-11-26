# Sample data source intersight_hyperflex_cluster_backup_policy — reads ../models/data_intersight_hyperflex_cluster_backup_policy.yml
locals { m583 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_backup_policy.yml"))["data_intersight_hyperflex_cluster_backup_policy"] }

data "intersight_hyperflex_cluster_backup_policy" "n583" {
  account_moid = try(local.m583["account_moid"], null)
  additional_properties = try(local.m583["additional_properties"], null)
  backup_data_store_name = try(local.m583["backup_data_store_name"], null)
  backup_data_store_size = try(local.m583["backup_data_store_size"], null)
  backup_data_store_size_unit = try(local.m583["backup_data_store_size_unit"], null)
  class_id = try(local.m583["class_id"], null)
  create_time = try(local.m583["create_time"], null)
  data_store_encryption_enabled = try(local.m583["data_store_encryption_enabled"], null)
  description = try(local.m583["description"], null)
  domain_group_moid = try(local.m583["domain_group_moid"], null)
  id = try(local.m583["id"], null)
  local_snapshot_retention_count = try(local.m583["local_snapshot_retention_count"], null)
  mod_time = try(local.m583["mod_time"], null)
  moid = try(local.m583["moid"], null)
  name = try(local.m583["name"], null)
  object_type = try(local.m583["object_type"], null)
  owners = try(local.m583["owners"], null)
  replication_pair_name_prefix = try(local.m583["replication_pair_name_prefix"], null)
  results = try(local.m583["results"], null)
  shared_scope = try(local.m583["shared_scope"], null)
  snapshot_retention_count = try(local.m583["snapshot_retention_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m583["ancestors"], null) == null ? [] : local.m583["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_target" {
    for_each = try(local.m583["backup_target"], null) == null ? [] : local.m583["backup_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m583["cluster_profiles"], null) == null ? [] : local.m583["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m583["organization"], null) == null ? [] : local.m583["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m583["parent"], null) == null ? [] : local.m583["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m583["permission_resources"], null) == null ? [] : local.m583["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_schedule" {
    for_each = try(local.m583["replication_schedule"], null) == null ? [] : local.m583["replication_schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m583["tags"], null) == null ? [] : local.m583["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m583["version_context"], null) == null ? [] : local.m583["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
