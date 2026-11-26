# Sample data source intersight_equipment_io_card_operation — reads ../models/data_intersight_equipment_io_card_operation.yml
locals { m321 = yamldecode(file("${path.module}/../models/data_intersight_equipment_io_card_operation.yml"))["data_intersight_equipment_io_card_operation"] }

data "intersight_equipment_io_card_operation" "n321" {
  account_moid = try(local.m321["account_moid"], null)
  additional_properties = try(local.m321["additional_properties"], null)
  admin_peer_power_state = try(local.m321["admin_peer_power_state"], null)
  admin_power_state = try(local.m321["admin_power_state"], null)
  affected_obj_name = try(local.m321["affected_obj_name"], null)
  class_id = try(local.m321["class_id"], null)
  config_state = try(local.m321["config_state"], null)
  create_time = try(local.m321["create_time"], null)
  domain_group_moid = try(local.m321["domain_group_moid"], null)
  id = try(local.m321["id"], null)
  mod_time = try(local.m321["mod_time"], null)
  moid = try(local.m321["moid"], null)
  object_type = try(local.m321["object_type"], null)
  owners = try(local.m321["owners"], null)
  results = try(local.m321["results"], null)
  shared_scope = try(local.m321["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m321["ancestors"], null) == null ? [] : local.m321["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m321["device_registration"], null) == null ? [] : local.m321["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "io_card" {
    for_each = try(local.m321["io_card"], null) == null ? [] : local.m321["io_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "io_card_operation_status" {
    for_each = try(local.m321["io_card_operation_status"], null) == null ? [] : local.m321["io_card_operation_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m321["parent"], null) == null ? [] : local.m321["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m321["permission_resources"], null) == null ? [] : local.m321["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m321["tags"], null) == null ? [] : local.m321["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m321["version_context"], null) == null ? [] : local.m321["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
