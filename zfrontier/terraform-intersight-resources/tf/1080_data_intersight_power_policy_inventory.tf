# Sample data source intersight_power_policy_inventory — reads ../models/data_intersight_power_policy_inventory.yml
locals { m1080 = yamldecode(file("${path.module}/../models/data_intersight_power_policy_inventory.yml"))["data_intersight_power_policy_inventory"] }

data "intersight_power_policy_inventory" "n1080" {
  account_moid = try(local.m1080["account_moid"], null)
  additional_properties = try(local.m1080["additional_properties"], null)
  allocated_budget = try(local.m1080["allocated_budget"], null)
  class_id = try(local.m1080["class_id"], null)
  create_time = try(local.m1080["create_time"], null)
  description = try(local.m1080["description"], null)
  device_mo_id = try(local.m1080["device_mo_id"], null)
  domain_group_moid = try(local.m1080["domain_group_moid"], null)
  dynamic_rebalancing = try(local.m1080["dynamic_rebalancing"], null)
  extended_power_capacity = try(local.m1080["extended_power_capacity"], null)
  id = try(local.m1080["id"], null)
  mod_time = try(local.m1080["mod_time"], null)
  moid = try(local.m1080["moid"], null)
  name = try(local.m1080["name"], null)
  object_type = try(local.m1080["object_type"], null)
  owners = try(local.m1080["owners"], null)
  power_priority = try(local.m1080["power_priority"], null)
  power_profiling = try(local.m1080["power_profiling"], null)
  power_restore_state = try(local.m1080["power_restore_state"], null)
  power_save_mode = try(local.m1080["power_save_mode"], null)
  processor_package_power_limit = try(local.m1080["processor_package_power_limit"], null)
  redundancy_mode = try(local.m1080["redundancy_mode"], null)
  results = try(local.m1080["results"], null)
  shared_scope = try(local.m1080["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1080["ancestors"], null) == null ? [] : local.m1080["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1080["parent"], null) == null ? [] : local.m1080["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1080["permission_resources"], null) == null ? [] : local.m1080["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1080["tags"], null) == null ? [] : local.m1080["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1080["target_mo"], null) == null ? [] : local.m1080["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1080["version_context"], null) == null ? [] : local.m1080["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
