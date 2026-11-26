# Sample data source intersight_power_control_state — reads ../models/data_intersight_power_control_state.yml
locals { m1078 = yamldecode(file("${path.module}/../models/data_intersight_power_control_state.yml"))["data_intersight_power_control_state"] }

data "intersight_power_control_state" "n1078" {
  account_moid = try(local.m1078["account_moid"], null)
  additional_properties = try(local.m1078["additional_properties"], null)
  allocated_power = try(local.m1078["allocated_power"], null)
  class_id = try(local.m1078["class_id"], null)
  create_time = try(local.m1078["create_time"], null)
  domain_group_moid = try(local.m1078["domain_group_moid"], null)
  extended_power_capacity = try(local.m1078["extended_power_capacity"], null)
  grid_max_power = try(local.m1078["grid_max_power"], null)
  id = try(local.m1078["id"], null)
  max_required_power = try(local.m1078["max_required_power"], null)
  min_required_power = try(local.m1078["min_required_power"], null)
  mod_time = try(local.m1078["mod_time"], null)
  moid = try(local.m1078["moid"], null)
  n1_max_power = try(local.m1078["n1_max_power"], null)
  n2_max_power = try(local.m1078["n2_max_power"], null)
  non_redundant_max_power = try(local.m1078["non_redundant_max_power"], null)
  object_type = try(local.m1078["object_type"], null)
  owners = try(local.m1078["owners"], null)
  power_rebalancing = try(local.m1078["power_rebalancing"], null)
  power_save_mode = try(local.m1078["power_save_mode"], null)
  results = try(local.m1078["results"], null)
  shared_scope = try(local.m1078["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1078["ancestors"], null) == null ? [] : local.m1078["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m1078["equipment_chassis"], null) == null ? [] : local.m1078["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1078["parent"], null) == null ? [] : local.m1078["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1078["permission_resources"], null) == null ? [] : local.m1078["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1078["registered_device"], null) == null ? [] : local.m1078["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1078["tags"], null) == null ? [] : local.m1078["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1078["version_context"], null) == null ? [] : local.m1078["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
