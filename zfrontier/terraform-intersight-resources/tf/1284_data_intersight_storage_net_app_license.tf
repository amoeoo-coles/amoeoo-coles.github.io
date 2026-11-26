# Sample data source intersight_storage_net_app_license — reads ../models/data_intersight_storage_net_app_license.yml
locals { m1284 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_license.yml"))["data_intersight_storage_net_app_license"] }

data "intersight_storage_net_app_license" "n1284" {
  account_moid = try(local.m1284["account_moid"], null)
  additional_properties = try(local.m1284["additional_properties"], null)
  class_id = try(local.m1284["class_id"], null)
  cluster_uuid = try(local.m1284["cluster_uuid"], null)
  create_time = try(local.m1284["create_time"], null)
  domain_group_moid = try(local.m1284["domain_group_moid"], null)
  id = try(local.m1284["id"], null)
  mod_time = try(local.m1284["mod_time"], null)
  moid = try(local.m1284["moid"], null)
  name = try(local.m1284["name"], null)
  object_type = try(local.m1284["object_type"], null)
  owners = try(local.m1284["owners"], null)
  results = try(local.m1284["results"], null)
  shared_scope = try(local.m1284["shared_scope"], null)
  state = try(local.m1284["state"], null)
  dynamic "ancestors" {
    for_each = try(local.m1284["ancestors"], null) == null ? [] : local.m1284["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1284["array"], null) == null ? [] : local.m1284["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1284["parent"], null) == null ? [] : local.m1284["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1284["permission_resources"], null) == null ? [] : local.m1284["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1284["tags"], null) == null ? [] : local.m1284["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1284["version_context"], null) == null ? [] : local.m1284["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
