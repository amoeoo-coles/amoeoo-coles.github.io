# Sample data source intersight_equipment_chassis_controller — reads ../models/data_intersight_equipment_chassis_controller.yml
locals { m301 = yamldecode(file("${path.module}/../models/data_intersight_equipment_chassis_controller.yml"))["data_intersight_equipment_chassis_controller"] }

data "intersight_equipment_chassis_controller" "n301" {
  account_moid = try(local.m301["account_moid"], null)
  additional_properties = try(local.m301["additional_properties"], null)
  class_id = try(local.m301["class_id"], null)
  create_time = try(local.m301["create_time"], null)
  device_mo_id = try(local.m301["device_mo_id"], null)
  dn = try(local.m301["dn"], null)
  domain_group_moid = try(local.m301["domain_group_moid"], null)
  equipment_type = try(local.m301["equipment_type"], null)
  id = try(local.m301["id"], null)
  is_upgraded = try(local.m301["is_upgraded"], null)
  mod_time = try(local.m301["mod_time"], null)
  model = try(local.m301["model"], null)
  moid = try(local.m301["moid"], null)
  object_type = try(local.m301["object_type"], null)
  oper_reason = try(local.m301["oper_reason"], null)
  oper_state = try(local.m301["oper_state"], null)
  owners = try(local.m301["owners"], null)
  presence = try(local.m301["presence"], null)
  results = try(local.m301["results"], null)
  revision = try(local.m301["revision"], null)
  rn = try(local.m301["rn"], null)
  serial = try(local.m301["serial"], null)
  shared_scope = try(local.m301["shared_scope"], null)
  vendor = try(local.m301["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m301["ancestors"], null) == null ? [] : local.m301["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m301["network_element"], null) == null ? [] : local.m301["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m301["parent"], null) == null ? [] : local.m301["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m301["permission_resources"], null) == null ? [] : local.m301["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m301["previous_fru"], null) == null ? [] : local.m301["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m301["registered_device"], null) == null ? [] : local.m301["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m301["tags"], null) == null ? [] : local.m301["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m301["version_context"], null) == null ? [] : local.m301["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
