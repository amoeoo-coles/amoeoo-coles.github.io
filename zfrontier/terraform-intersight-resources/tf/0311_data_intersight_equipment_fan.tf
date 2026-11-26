# Sample data source intersight_equipment_fan — reads ../models/data_intersight_equipment_fan.yml
locals { m311 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fan.yml"))["data_intersight_equipment_fan"] }

data "intersight_equipment_fan" "n311" {
  account_moid = try(local.m311["account_moid"], null)
  additional_properties = try(local.m311["additional_properties"], null)
  class_id = try(local.m311["class_id"], null)
  create_time = try(local.m311["create_time"], null)
  description = try(local.m311["description"], null)
  device_mo_id = try(local.m311["device_mo_id"], null)
  dn = try(local.m311["dn"], null)
  domain_group_moid = try(local.m311["domain_group_moid"], null)
  fan_id = try(local.m311["fan_id"], null)
  fan_module_id = try(local.m311["fan_module_id"], null)
  id = try(local.m311["id"], null)
  is_upgraded = try(local.m311["is_upgraded"], null)
  mod_time = try(local.m311["mod_time"], null)
  model = try(local.m311["model"], null)
  module_id = try(local.m311["module_id"], null)
  moid = try(local.m311["moid"], null)
  name = try(local.m311["name"], null)
  nr_threshold_min_rpm_speed = try(local.m311["nr_threshold_min_rpm_speed"], null)
  object_type = try(local.m311["object_type"], null)
  oper_reason = try(local.m311["oper_reason"], null)
  oper_state = try(local.m311["oper_state"], null)
  owners = try(local.m311["owners"], null)
  part_number = try(local.m311["part_number"], null)
  pid = try(local.m311["pid"], null)
  presence = try(local.m311["presence"], null)
  results = try(local.m311["results"], null)
  revision = try(local.m311["revision"], null)
  rn = try(local.m311["rn"], null)
  serial = try(local.m311["serial"], null)
  shared_scope = try(local.m311["shared_scope"], null)
  sku = try(local.m311["sku"], null)
  tray_id = try(local.m311["tray_id"], null)
  vendor = try(local.m311["vendor"], null)
  vid = try(local.m311["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m311["ancestors"], null) == null ? [] : local.m311["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fan_module" {
    for_each = try(local.m311["equipment_fan_module"], null) == null ? [] : local.m311["equipment_fan_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fex" {
    for_each = try(local.m311["equipment_fex"], null) == null ? [] : local.m311["equipment_fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m311["inventory_device_info"], null) == null ? [] : local.m311["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m311["parent"], null) == null ? [] : local.m311["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m311["permission_resources"], null) == null ? [] : local.m311["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m311["previous_fru"], null) == null ? [] : local.m311["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m311["registered_device"], null) == null ? [] : local.m311["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m311["tags"], null) == null ? [] : local.m311["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m311["version_context"], null) == null ? [] : local.m311["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
