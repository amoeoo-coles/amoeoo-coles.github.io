# Sample data source intersight_equipment_expander_module_operation — reads ../models/data_intersight_equipment_expander_module_operation.yml
locals { m310 = yamldecode(file("${path.module}/../models/data_intersight_equipment_expander_module_operation.yml"))["data_intersight_equipment_expander_module_operation"] }

data "intersight_equipment_expander_module_operation" "n310" {
  account_moid = try(local.m310["account_moid"], null)
  additional_properties = try(local.m310["additional_properties"], null)
  admin_operation = try(local.m310["admin_operation"], null)
  affected_obj_name = try(local.m310["affected_obj_name"], null)
  class_id = try(local.m310["class_id"], null)
  config_state = try(local.m310["config_state"], null)
  create_time = try(local.m310["create_time"], null)
  domain_group_moid = try(local.m310["domain_group_moid"], null)
  id = try(local.m310["id"], null)
  mod_time = try(local.m310["mod_time"], null)
  moid = try(local.m310["moid"], null)
  object_type = try(local.m310["object_type"], null)
  owners = try(local.m310["owners"], null)
  results = try(local.m310["results"], null)
  serial = try(local.m310["serial"], null)
  shared_scope = try(local.m310["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m310["ancestors"], null) == null ? [] : local.m310["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m310["device_registration"], null) == null ? [] : local.m310["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expander_module" {
    for_each = try(local.m310["expander_module"], null) == null ? [] : local.m310["expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "expander_module_operation_status" {
    for_each = try(local.m310["expander_module_operation_status"], null) == null ? [] : local.m310["expander_module_operation_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m310["parent"], null) == null ? [] : local.m310["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m310["permission_resources"], null) == null ? [] : local.m310["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m310["tags"], null) == null ? [] : local.m310["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m310["version_context"], null) == null ? [] : local.m310["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
