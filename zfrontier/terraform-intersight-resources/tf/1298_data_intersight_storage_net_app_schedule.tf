# Sample data source intersight_storage_net_app_schedule — reads ../models/data_intersight_storage_net_app_schedule.yml
locals { m1298 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_schedule.yml"))["data_intersight_storage_net_app_schedule"] }

data "intersight_storage_net_app_schedule" "n1298" {
  account_moid = try(local.m1298["account_moid"], null)
  additional_properties = try(local.m1298["additional_properties"], null)
  class_id = try(local.m1298["class_id"], null)
  create_time = try(local.m1298["create_time"], null)
  domain_group_moid = try(local.m1298["domain_group_moid"], null)
  id = try(local.m1298["id"], null)
  mod_time = try(local.m1298["mod_time"], null)
  moid = try(local.m1298["moid"], null)
  name = try(local.m1298["name"], null)
  object_type = try(local.m1298["object_type"], null)
  owners = try(local.m1298["owners"], null)
  results = try(local.m1298["results"], null)
  shared_scope = try(local.m1298["shared_scope"], null)
  type = try(local.m1298["type"], null)
  uuid = try(local.m1298["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1298["ancestors"], null) == null ? [] : local.m1298["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1298["array"], null) == null ? [] : local.m1298["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1298["parent"], null) == null ? [] : local.m1298["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1298["permission_resources"], null) == null ? [] : local.m1298["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1298["tags"], null) == null ? [] : local.m1298["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1298["version_context"], null) == null ? [] : local.m1298["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
