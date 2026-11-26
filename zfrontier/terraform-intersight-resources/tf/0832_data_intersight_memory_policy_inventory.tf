# Sample data source intersight_memory_policy_inventory — reads ../models/data_intersight_memory_policy_inventory.yml
locals { m832 = yamldecode(file("${path.module}/../models/data_intersight_memory_policy_inventory.yml"))["data_intersight_memory_policy_inventory"] }

data "intersight_memory_policy_inventory" "n832" {
  account_moid = try(local.m832["account_moid"], null)
  additional_properties = try(local.m832["additional_properties"], null)
  class_id = try(local.m832["class_id"], null)
  create_time = try(local.m832["create_time"], null)
  description = try(local.m832["description"], null)
  device_mo_id = try(local.m832["device_mo_id"], null)
  domain_group_moid = try(local.m832["domain_group_moid"], null)
  enable_dimm_blocklisting = try(local.m832["enable_dimm_blocklisting"], null)
  id = try(local.m832["id"], null)
  mod_time = try(local.m832["mod_time"], null)
  moid = try(local.m832["moid"], null)
  name = try(local.m832["name"], null)
  object_type = try(local.m832["object_type"], null)
  owners = try(local.m832["owners"], null)
  results = try(local.m832["results"], null)
  shared_scope = try(local.m832["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m832["ancestors"], null) == null ? [] : local.m832["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m832["parent"], null) == null ? [] : local.m832["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m832["permission_resources"], null) == null ? [] : local.m832["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m832["tags"], null) == null ? [] : local.m832["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m832["target_mo"], null) == null ? [] : local.m832["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m832["version_context"], null) == null ? [] : local.m832["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
