# Sample data source intersight_capability_switch_descriptor — reads ../models/data_intersight_capability_switch_descriptor.yml
locals { m190 = yamldecode(file("${path.module}/../models/data_intersight_capability_switch_descriptor.yml"))["data_intersight_capability_switch_descriptor"] }

data "intersight_capability_switch_descriptor" "n190" {
  account_moid = try(local.m190["account_moid"], null)
  additional_properties = try(local.m190["additional_properties"], null)
  class_id = try(local.m190["class_id"], null)
  create_time = try(local.m190["create_time"], null)
  description = try(local.m190["description"], null)
  domain_group_moid = try(local.m190["domain_group_moid"], null)
  expected_memory = try(local.m190["expected_memory"], null)
  id = try(local.m190["id"], null)
  is_avatar_ecmc = try(local.m190["is_avatar_ecmc"], null)
  is_ucsx_direct_switch = try(local.m190["is_ucsx_direct_switch"], null)
  mod_time = try(local.m190["mod_time"], null)
  model = try(local.m190["model"], null)
  moid = try(local.m190["moid"], null)
  nr_version = try(local.m190["nr_version"], null)
  object_type = try(local.m190["object_type"], null)
  owners = try(local.m190["owners"], null)
  results = try(local.m190["results"], null)
  revision = try(local.m190["revision"], null)
  shared_scope = try(local.m190["shared_scope"], null)
  unsupported_policies = try(local.m190["unsupported_policies"], null)
  vendor = try(local.m190["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m190["ancestors"], null) == null ? [] : local.m190["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m190["capabilities"], null) == null ? [] : local.m190["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m190["parent"], null) == null ? [] : local.m190["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m190["permission_resources"], null) == null ? [] : local.m190["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m190["tags"], null) == null ? [] : local.m190["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m190["version_context"], null) == null ? [] : local.m190["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
