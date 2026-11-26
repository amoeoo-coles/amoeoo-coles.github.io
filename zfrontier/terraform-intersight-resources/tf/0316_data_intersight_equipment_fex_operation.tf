# Sample data source intersight_equipment_fex_operation — reads ../models/data_intersight_equipment_fex_operation.yml
locals { m316 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fex_operation.yml"))["data_intersight_equipment_fex_operation"] }

data "intersight_equipment_fex_operation" "n316" {
  account_moid = try(local.m316["account_moid"], null)
  additional_properties = try(local.m316["additional_properties"], null)
  admin_locator_led_action = try(local.m316["admin_locator_led_action"], null)
  admin_locator_led_action_state = try(local.m316["admin_locator_led_action_state"], null)
  class_id = try(local.m316["class_id"], null)
  create_time = try(local.m316["create_time"], null)
  domain_group_moid = try(local.m316["domain_group_moid"], null)
  id = try(local.m316["id"], null)
  mod_time = try(local.m316["mod_time"], null)
  moid = try(local.m316["moid"], null)
  object_type = try(local.m316["object_type"], null)
  owners = try(local.m316["owners"], null)
  results = try(local.m316["results"], null)
  shared_scope = try(local.m316["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m316["ancestors"], null) == null ? [] : local.m316["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m316["device_registration"], null) == null ? [] : local.m316["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fex" {
    for_each = try(local.m316["fex"], null) == null ? [] : local.m316["fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m316["parent"], null) == null ? [] : local.m316["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m316["permission_resources"], null) == null ? [] : local.m316["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m316["tags"], null) == null ? [] : local.m316["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m316["version_context"], null) == null ? [] : local.m316["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
