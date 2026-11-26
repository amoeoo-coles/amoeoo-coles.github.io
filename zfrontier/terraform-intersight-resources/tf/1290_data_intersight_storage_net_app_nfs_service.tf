# Sample data source intersight_storage_net_app_nfs_service — reads ../models/data_intersight_storage_net_app_nfs_service.yml
locals { m1290 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_nfs_service.yml"))["data_intersight_storage_net_app_nfs_service"] }

data "intersight_storage_net_app_nfs_service" "n1290" {
  account_moid = try(local.m1290["account_moid"], null)
  additional_properties = try(local.m1290["additional_properties"], null)
  class_id = try(local.m1290["class_id"], null)
  create_time = try(local.m1290["create_time"], null)
  domain_group_moid = try(local.m1290["domain_group_moid"], null)
  id = try(local.m1290["id"], null)
  mod_time = try(local.m1290["mod_time"], null)
  moid = try(local.m1290["moid"], null)
  nfs_v3_enabled = try(local.m1290["nfs_v3_enabled"], null)
  nfs_v41_enabled = try(local.m1290["nfs_v41_enabled"], null)
  nfs_v4_enabled = try(local.m1290["nfs_v4_enabled"], null)
  object_type = try(local.m1290["object_type"], null)
  owners = try(local.m1290["owners"], null)
  results = try(local.m1290["results"], null)
  shared_scope = try(local.m1290["shared_scope"], null)
  svm_uuid = try(local.m1290["svm_uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1290["ancestors"], null) == null ? [] : local.m1290["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1290["parent"], null) == null ? [] : local.m1290["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1290["permission_resources"], null) == null ? [] : local.m1290["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1290["tags"], null) == null ? [] : local.m1290["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1290["tenant"], null) == null ? [] : local.m1290["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1290["version_context"], null) == null ? [] : local.m1290["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
