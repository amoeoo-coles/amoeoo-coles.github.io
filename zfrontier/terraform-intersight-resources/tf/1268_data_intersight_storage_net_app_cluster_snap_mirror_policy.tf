# Sample data source intersight_storage_net_app_cluster_snap_mirror_policy — reads ../models/data_intersight_storage_net_app_cluster_snap_mirror_policy.yml
locals { m1268 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cluster_snap_mirror_policy.yml"))["data_intersight_storage_net_app_cluster_snap_mirror_policy"] }

data "intersight_storage_net_app_cluster_snap_mirror_policy" "n1268" {
  account_moid = try(local.m1268["account_moid"], null)
  additional_properties = try(local.m1268["additional_properties"], null)
  class_id = try(local.m1268["class_id"], null)
  comment = try(local.m1268["comment"], null)
  copy_all_source_snapshots = try(local.m1268["copy_all_source_snapshots"], null)
  create_time = try(local.m1268["create_time"], null)
  domain_group_moid = try(local.m1268["domain_group_moid"], null)
  id = try(local.m1268["id"], null)
  mod_time = try(local.m1268["mod_time"], null)
  moid = try(local.m1268["moid"], null)
  name = try(local.m1268["name"], null)
  object_type = try(local.m1268["object_type"], null)
  owners = try(local.m1268["owners"], null)
  results = try(local.m1268["results"], null)
  scope = try(local.m1268["scope"], null)
  shared_scope = try(local.m1268["shared_scope"], null)
  sync_type = try(local.m1268["sync_type"], null)
  transfer_schedule_name = try(local.m1268["transfer_schedule_name"], null)
  transfer_schedule_uuid = try(local.m1268["transfer_schedule_uuid"], null)
  type = try(local.m1268["type"], null)
  uuid = try(local.m1268["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1268["ancestors"], null) == null ? [] : local.m1268["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1268["array"], null) == null ? [] : local.m1268["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1268["parent"], null) == null ? [] : local.m1268["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1268["permission_resources"], null) == null ? [] : local.m1268["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1268["tags"], null) == null ? [] : local.m1268["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1268["version_context"], null) == null ? [] : local.m1268["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
