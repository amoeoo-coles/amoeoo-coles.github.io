# Sample data source intersight_storage_pure_directory_quota — reads ../models/data_intersight_storage_pure_directory_quota.yml
locals { m1319 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_directory_quota.yml"))["data_intersight_storage_pure_directory_quota"] }

data "intersight_storage_pure_directory_quota" "n1319" {
  account_moid = try(local.m1319["account_moid"], null)
  additional_properties = try(local.m1319["additional_properties"], null)
  class_id = try(local.m1319["class_id"], null)
  create_time = try(local.m1319["create_time"], null)
  destroyed = try(local.m1319["destroyed"], null)
  directory_name = try(local.m1319["directory_name"], null)
  directory_resource_type = try(local.m1319["directory_resource_type"], null)
  domain_group_moid = try(local.m1319["domain_group_moid"], null)
  enabled = try(local.m1319["enabled"], null)
  id = try(local.m1319["id"], null)
  mod_time = try(local.m1319["mod_time"], null)
  moid = try(local.m1319["moid"], null)
  object_type = try(local.m1319["object_type"], null)
  owners = try(local.m1319["owners"], null)
  policy_name = try(local.m1319["policy_name"], null)
  policy_resource_type = try(local.m1319["policy_resource_type"], null)
  results = try(local.m1319["results"], null)
  shared_scope = try(local.m1319["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1319["ancestors"], null) == null ? [] : local.m1319["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1319["array"], null) == null ? [] : local.m1319["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "directory" {
    for_each = try(local.m1319["directory"], null) == null ? [] : local.m1319["directory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1319["parent"], null) == null ? [] : local.m1319["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1319["permission_resources"], null) == null ? [] : local.m1319["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1319["policy"], null) == null ? [] : local.m1319["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1319["registered_device"], null) == null ? [] : local.m1319["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1319["tags"], null) == null ? [] : local.m1319["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1319["version_context"], null) == null ? [] : local.m1319["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
