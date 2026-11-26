# Sample data source intersight_storage_pure_directory_export — reads ../models/data_intersight_storage_pure_directory_export.yml
locals { m1317 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_directory_export.yml"))["data_intersight_storage_pure_directory_export"] }

data "intersight_storage_pure_directory_export" "n1317" {
  account_moid = try(local.m1317["account_moid"], null)
  additional_properties = try(local.m1317["additional_properties"], null)
  class_id = try(local.m1317["class_id"], null)
  create_time = try(local.m1317["create_time"], null)
  destroyed = try(local.m1317["destroyed"], null)
  directory_name = try(local.m1317["directory_name"], null)
  directory_resource_type = try(local.m1317["directory_resource_type"], null)
  domain_group_moid = try(local.m1317["domain_group_moid"], null)
  enabled = try(local.m1317["enabled"], null)
  id = try(local.m1317["id"], null)
  mod_time = try(local.m1317["mod_time"], null)
  moid = try(local.m1317["moid"], null)
  name = try(local.m1317["name"], null)
  object_type = try(local.m1317["object_type"], null)
  owners = try(local.m1317["owners"], null)
  path = try(local.m1317["path"], null)
  policy_name = try(local.m1317["policy_name"], null)
  policy_resource_type = try(local.m1317["policy_resource_type"], null)
  results = try(local.m1317["results"], null)
  shared_scope = try(local.m1317["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1317["ancestors"], null) == null ? [] : local.m1317["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1317["array"], null) == null ? [] : local.m1317["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "directory" {
    for_each = try(local.m1317["directory"], null) == null ? [] : local.m1317["directory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1317["parent"], null) == null ? [] : local.m1317["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1317["permission_resources"], null) == null ? [] : local.m1317["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1317["policy"], null) == null ? [] : local.m1317["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1317["registered_device"], null) == null ? [] : local.m1317["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1317["tags"], null) == null ? [] : local.m1317["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1317["version_context"], null) == null ? [] : local.m1317["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
