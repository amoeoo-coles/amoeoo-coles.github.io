# Sample data source intersight_equipment_fan_control — reads ../models/data_intersight_equipment_fan_control.yml
locals { m312 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fan_control.yml"))["data_intersight_equipment_fan_control"] }

data "intersight_equipment_fan_control" "n312" {
  account_moid = try(local.m312["account_moid"], null)
  additional_properties = try(local.m312["additional_properties"], null)
  class_id = try(local.m312["class_id"], null)
  create_time = try(local.m312["create_time"], null)
  device_mo_id = try(local.m312["device_mo_id"], null)
  dn = try(local.m312["dn"], null)
  domain_group_moid = try(local.m312["domain_group_moid"], null)
  id = try(local.m312["id"], null)
  is_upgraded = try(local.m312["is_upgraded"], null)
  mod_time = try(local.m312["mod_time"], null)
  mode = try(local.m312["mode"], null)
  model = try(local.m312["model"], null)
  moid = try(local.m312["moid"], null)
  object_type = try(local.m312["object_type"], null)
  owners = try(local.m312["owners"], null)
  presence = try(local.m312["presence"], null)
  results = try(local.m312["results"], null)
  revision = try(local.m312["revision"], null)
  rn = try(local.m312["rn"], null)
  serial = try(local.m312["serial"], null)
  shared_scope = try(local.m312["shared_scope"], null)
  vendor = try(local.m312["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m312["ancestors"], null) == null ? [] : local.m312["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m312["equipment_chassis"], null) == null ? [] : local.m312["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m312["inventory_device_info"], null) == null ? [] : local.m312["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m312["parent"], null) == null ? [] : local.m312["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m312["permission_resources"], null) == null ? [] : local.m312["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m312["previous_fru"], null) == null ? [] : local.m312["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m312["registered_device"], null) == null ? [] : local.m312["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m312["tags"], null) == null ? [] : local.m312["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m312["version_context"], null) == null ? [] : local.m312["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
