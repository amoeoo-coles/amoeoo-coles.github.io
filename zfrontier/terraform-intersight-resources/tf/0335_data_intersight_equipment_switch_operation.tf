# Sample data source intersight_equipment_switch_operation — reads ../models/data_intersight_equipment_switch_operation.yml
locals { m335 = yamldecode(file("${path.module}/../models/data_intersight_equipment_switch_operation.yml"))["data_intersight_equipment_switch_operation"] }

data "intersight_equipment_switch_operation" "n335" {
  account_moid = try(local.m335["account_moid"], null)
  additional_properties = try(local.m335["additional_properties"], null)
  admin_evac_state = try(local.m335["admin_evac_state"], null)
  admin_locator_led_action = try(local.m335["admin_locator_led_action"], null)
  admin_locator_led_action_state = try(local.m335["admin_locator_led_action_state"], null)
  class_id = try(local.m335["class_id"], null)
  config_evac_state = try(local.m335["config_evac_state"], null)
  create_time = try(local.m335["create_time"], null)
  domain_group_moid = try(local.m335["domain_group_moid"], null)
  force_evac = try(local.m335["force_evac"], null)
  id = try(local.m335["id"], null)
  mod_time = try(local.m335["mod_time"], null)
  moid = try(local.m335["moid"], null)
  object_type = try(local.m335["object_type"], null)
  owners = try(local.m335["owners"], null)
  reset_action_state = try(local.m335["reset_action_state"], null)
  results = try(local.m335["results"], null)
  shared_scope = try(local.m335["shared_scope"], null)
  switch_name = try(local.m335["switch_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m335["ancestors"], null) == null ? [] : local.m335["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m335["device_registration"], null) == null ? [] : local.m335["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m335["network_element"], null) == null ? [] : local.m335["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m335["parent"], null) == null ? [] : local.m335["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m335["permission_resources"], null) == null ? [] : local.m335["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reset_action" {
    for_each = try(local.m335["reset_action"], null) == null ? [] : local.m335["reset_action"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m335["tags"], null) == null ? [] : local.m335["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m335["version_context"], null) == null ? [] : local.m335["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
