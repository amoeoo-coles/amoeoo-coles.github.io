# Sample data source intersight_hyperflex_cluster_backup_policy_deployment — reads ../models/data_intersight_hyperflex_cluster_backup_policy_deployment.yml
locals { m584 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_backup_policy_deployment.yml"))["data_intersight_hyperflex_cluster_backup_policy_deployment"] }

data "intersight_hyperflex_cluster_backup_policy_deployment" "n584" {
  account_moid = try(local.m584["account_moid"], null)
  additional_properties = try(local.m584["additional_properties"], null)
  backup_data_store_name = try(local.m584["backup_data_store_name"], null)
  backup_data_store_size = try(local.m584["backup_data_store_size"], null)
  backup_data_store_size_unit = try(local.m584["backup_data_store_size_unit"], null)
  class_id = try(local.m584["class_id"], null)
  create_time = try(local.m584["create_time"], null)
  data_store_encryption_enabled = try(local.m584["data_store_encryption_enabled"], null)
  description = try(local.m584["description"], null)
  discovered = try(local.m584["discovered"], null)
  domain_group_moid = try(local.m584["domain_group_moid"], null)
  id = try(local.m584["id"], null)
  local_snapshot_retention_count = try(local.m584["local_snapshot_retention_count"], null)
  mod_time = try(local.m584["mod_time"], null)
  moid = try(local.m584["moid"], null)
  name = try(local.m584["name"], null)
  object_type = try(local.m584["object_type"], null)
  owners = try(local.m584["owners"], null)
  policy_moid = try(local.m584["policy_moid"], null)
  profile_moid = try(local.m584["profile_moid"], null)
  replication_pair_name_prefix = try(local.m584["replication_pair_name_prefix"], null)
  results = try(local.m584["results"], null)
  shared_scope = try(local.m584["shared_scope"], null)
  snapshot_retention_count = try(local.m584["snapshot_retention_count"], null)
  source_detached = try(local.m584["source_detached"], null)
  source_request_id = try(local.m584["source_request_id"], null)
  source_uuid = try(local.m584["source_uuid"], null)
  target_detached = try(local.m584["target_detached"], null)
  target_request_id = try(local.m584["target_request_id"], null)
  target_uuid = try(local.m584["target_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m584["ancestors"], null) == null ? [] : local.m584["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_target" {
    for_each = try(local.m584["backup_target"], null) == null ? [] : local.m584["backup_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m584["organization"], null) == null ? [] : local.m584["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m584["parent"], null) == null ? [] : local.m584["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m584["permission_resources"], null) == null ? [] : local.m584["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_schedule" {
    for_each = try(local.m584["replication_schedule"], null) == null ? [] : local.m584["replication_schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "source_cluster" {
    for_each = try(local.m584["source_cluster"], null) == null ? [] : local.m584["source_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m584["tags"], null) == null ? [] : local.m584["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m584["version_context"], null) == null ? [] : local.m584["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
