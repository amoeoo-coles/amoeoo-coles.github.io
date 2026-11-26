# Sample data source intersight_equipment_chassis_operation — reads ../models/data_intersight_equipment_chassis_operation.yml
locals { m304 = yamldecode(file("${path.module}/../models/data_intersight_equipment_chassis_operation.yml"))["data_intersight_equipment_chassis_operation"] }

data "intersight_equipment_chassis_operation" "n304" {
  account_moid = try(local.m304["account_moid"], null)
  additional_properties = try(local.m304["additional_properties"], null)
  admin_locator_led_action = try(local.m304["admin_locator_led_action"], null)
  admin_power_cycle_expander_module_slot_id = try(local.m304["admin_power_cycle_expander_module_slot_id"], null)
  admin_power_cycle_slot_id = try(local.m304["admin_power_cycle_slot_id"], null)
  admin_reset_config_slot_id = try(local.m304["admin_reset_config_slot_id"], null)
  class_id = try(local.m304["class_id"], null)
  config_state = try(local.m304["config_state"], null)
  create_time = try(local.m304["create_time"], null)
  domain_group_moid = try(local.m304["domain_group_moid"], null)
  id = try(local.m304["id"], null)
  mod_time = try(local.m304["mod_time"], null)
  moid = try(local.m304["moid"], null)
  object_type = try(local.m304["object_type"], null)
  owners = try(local.m304["owners"], null)
  results = try(local.m304["results"], null)
  shared_scope = try(local.m304["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m304["ancestors"], null) == null ? [] : local.m304["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis" {
    for_each = try(local.m304["chassis"], null) == null ? [] : local.m304["chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis_operation_status" {
    for_each = try(local.m304["chassis_operation_status"], null) == null ? [] : local.m304["chassis_operation_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m304["device_registration"], null) == null ? [] : local.m304["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m304["parent"], null) == null ? [] : local.m304["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m304["permission_resources"], null) == null ? [] : local.m304["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m304["tags"], null) == null ? [] : local.m304["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m304["version_context"], null) == null ? [] : local.m304["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
