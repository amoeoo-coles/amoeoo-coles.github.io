# Sample data source intersight_thermal_policy_inventory — reads ../models/data_intersight_thermal_policy_inventory.yml
locals { m1390 = yamldecode(file("${path.module}/../models/data_intersight_thermal_policy_inventory.yml"))["data_intersight_thermal_policy_inventory"] }

data "intersight_thermal_policy_inventory" "n1390" {
  account_moid = try(local.m1390["account_moid"], null)
  additional_properties = try(local.m1390["additional_properties"], null)
  aggressive_cooling = try(local.m1390["aggressive_cooling"], null)
  class_id = try(local.m1390["class_id"], null)
  create_time = try(local.m1390["create_time"], null)
  description = try(local.m1390["description"], null)
  device_mo_id = try(local.m1390["device_mo_id"], null)
  domain_group_moid = try(local.m1390["domain_group_moid"], null)
  fan_control_mode = try(local.m1390["fan_control_mode"], null)
  id = try(local.m1390["id"], null)
  mod_time = try(local.m1390["mod_time"], null)
  moid = try(local.m1390["moid"], null)
  name = try(local.m1390["name"], null)
  object_type = try(local.m1390["object_type"], null)
  owners = try(local.m1390["owners"], null)
  results = try(local.m1390["results"], null)
  shared_scope = try(local.m1390["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1390["ancestors"], null) == null ? [] : local.m1390["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1390["parent"], null) == null ? [] : local.m1390["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1390["permission_resources"], null) == null ? [] : local.m1390["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1390["tags"], null) == null ? [] : local.m1390["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1390["target_mo"], null) == null ? [] : local.m1390["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1390["version_context"], null) == null ? [] : local.m1390["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
