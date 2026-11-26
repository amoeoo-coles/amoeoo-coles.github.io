# Sample data source intersight_storage_net_app_iscsi_service — reads ../models/data_intersight_storage_net_app_iscsi_service.yml
locals { m1283 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_iscsi_service.yml"))["data_intersight_storage_net_app_iscsi_service"] }

data "intersight_storage_net_app_iscsi_service" "n1283" {
  account_moid = try(local.m1283["account_moid"], null)
  additional_properties = try(local.m1283["additional_properties"], null)
  class_id = try(local.m1283["class_id"], null)
  create_time = try(local.m1283["create_time"], null)
  domain_group_moid = try(local.m1283["domain_group_moid"], null)
  id = try(local.m1283["id"], null)
  mod_time = try(local.m1283["mod_time"], null)
  moid = try(local.m1283["moid"], null)
  object_type = try(local.m1283["object_type"], null)
  owners = try(local.m1283["owners"], null)
  results = try(local.m1283["results"], null)
  shared_scope = try(local.m1283["shared_scope"], null)
  svm_uuid = try(local.m1283["svm_uuid"], null)
  target_alias = try(local.m1283["target_alias"], null)
  target_name = try(local.m1283["target_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1283["ancestors"], null) == null ? [] : local.m1283["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1283["parent"], null) == null ? [] : local.m1283["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1283["permission_resources"], null) == null ? [] : local.m1283["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1283["tags"], null) == null ? [] : local.m1283["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1283["tenant"], null) == null ? [] : local.m1283["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1283["version_context"], null) == null ? [] : local.m1283["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
