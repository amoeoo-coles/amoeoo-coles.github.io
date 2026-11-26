# Sample data source intersight_storage_net_app_svm_snap_mirror_policy — reads ../models/data_intersight_storage_net_app_svm_snap_mirror_policy.yml
locals { m1303 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_svm_snap_mirror_policy.yml"))["data_intersight_storage_net_app_svm_snap_mirror_policy"] }

data "intersight_storage_net_app_svm_snap_mirror_policy" "n1303" {
  account_moid = try(local.m1303["account_moid"], null)
  additional_properties = try(local.m1303["additional_properties"], null)
  class_id = try(local.m1303["class_id"], null)
  comment = try(local.m1303["comment"], null)
  copy_all_source_snapshots = try(local.m1303["copy_all_source_snapshots"], null)
  create_time = try(local.m1303["create_time"], null)
  domain_group_moid = try(local.m1303["domain_group_moid"], null)
  id = try(local.m1303["id"], null)
  mod_time = try(local.m1303["mod_time"], null)
  moid = try(local.m1303["moid"], null)
  name = try(local.m1303["name"], null)
  object_type = try(local.m1303["object_type"], null)
  owners = try(local.m1303["owners"], null)
  results = try(local.m1303["results"], null)
  scope = try(local.m1303["scope"], null)
  shared_scope = try(local.m1303["shared_scope"], null)
  svm_name = try(local.m1303["svm_name"], null)
  sync_type = try(local.m1303["sync_type"], null)
  transfer_schedule_name = try(local.m1303["transfer_schedule_name"], null)
  transfer_schedule_uuid = try(local.m1303["transfer_schedule_uuid"], null)
  type = try(local.m1303["type"], null)
  uuid = try(local.m1303["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1303["ancestors"], null) == null ? [] : local.m1303["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1303["parent"], null) == null ? [] : local.m1303["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1303["permission_resources"], null) == null ? [] : local.m1303["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1303["tags"], null) == null ? [] : local.m1303["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1303["tenant"], null) == null ? [] : local.m1303["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1303["version_context"], null) == null ? [] : local.m1303["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
