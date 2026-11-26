# Sample data source intersight_power_power_group — reads ../models/data_intersight_power_power_group.yml
locals { m1081 = yamldecode(file("${path.module}/../models/data_intersight_power_power_group.yml"))["data_intersight_power_power_group"] }

data "intersight_power_power_group" "n1081" {
  account_moid = try(local.m1081["account_moid"], null)
  additional_properties = try(local.m1081["additional_properties"], null)
  admin_state = try(local.m1081["admin_state"], null)
  buffer_power_required = try(local.m1081["buffer_power_required"], null)
  class_id = try(local.m1081["class_id"], null)
  config_state = try(local.m1081["config_state"], null)
  create_time = try(local.m1081["create_time"], null)
  description = try(local.m1081["description"], null)
  domain_group_moid = try(local.m1081["domain_group_moid"], null)
  id = try(local.m1081["id"], null)
  mod_time = try(local.m1081["mod_time"], null)
  moid = try(local.m1081["moid"], null)
  name = try(local.m1081["name"], null)
  object_type = try(local.m1081["object_type"], null)
  oper_state = try(local.m1081["oper_state"], null)
  owners = try(local.m1081["owners"], null)
  power_budget = try(local.m1081["power_budget"], null)
  results = try(local.m1081["results"], null)
  shared_scope = try(local.m1081["shared_scope"], null)
  total_maximum_power_required = try(local.m1081["total_maximum_power_required"], null)
  total_minimum_power_required = try(local.m1081["total_minimum_power_required"], null)
  dynamic "account" {
    for_each = try(local.m1081["account"], null) == null ? [] : local.m1081["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1081["ancestors"], null) == null ? [] : local.m1081["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_member" {
    for_each = try(local.m1081["inventory_device_member"], null) == null ? [] : local.m1081["inventory_device_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1081["parent"], null) == null ? [] : local.m1081["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1081["permission_resources"], null) == null ? [] : local.m1081["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "power_group_member" {
    for_each = try(local.m1081["power_group_member"], null) == null ? [] : local.m1081["power_group_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1081["tags"], null) == null ? [] : local.m1081["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1081["version_context"], null) == null ? [] : local.m1081["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
