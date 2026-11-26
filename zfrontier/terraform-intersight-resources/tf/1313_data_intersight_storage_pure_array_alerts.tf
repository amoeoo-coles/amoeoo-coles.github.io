# Sample data source intersight_storage_pure_array_alerts — reads ../models/data_intersight_storage_pure_array_alerts.yml
locals { m1313 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_array_alerts.yml"))["data_intersight_storage_pure_array_alerts"] }

data "intersight_storage_pure_array_alerts" "n1313" {
  account_moid = try(local.m1313["account_moid"], null)
  additional_properties = try(local.m1313["additional_properties"], null)
  cause = try(local.m1313["cause"], null)
  class_id = try(local.m1313["class_id"], null)
  component = try(local.m1313["component"], null)
  create_time = try(local.m1313["create_time"], null)
  created_at = try(local.m1313["created_at"], null)
  domain_group_moid = try(local.m1313["domain_group_moid"], null)
  id = try(local.m1313["id"], null)
  mod_time = try(local.m1313["mod_time"], null)
  moid = try(local.m1313["moid"], null)
  name = try(local.m1313["name"], null)
  object_type = try(local.m1313["object_type"], null)
  owners = try(local.m1313["owners"], null)
  results = try(local.m1313["results"], null)
  severity = try(local.m1313["severity"], null)
  shared_scope = try(local.m1313["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1313["ancestors"], null) == null ? [] : local.m1313["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1313["array"], null) == null ? [] : local.m1313["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1313["parent"], null) == null ? [] : local.m1313["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1313["permission_resources"], null) == null ? [] : local.m1313["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1313["tags"], null) == null ? [] : local.m1313["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1313["version_context"], null) == null ? [] : local.m1313["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
