# Sample data source intersight_equipment_fan_module — reads ../models/data_intersight_equipment_fan_module.yml
locals { m313 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fan_module.yml"))["data_intersight_equipment_fan_module"] }

data "intersight_equipment_fan_module" "n313" {
  account_moid = try(local.m313["account_moid"], null)
  additional_properties = try(local.m313["additional_properties"], null)
  class_id = try(local.m313["class_id"], null)
  create_time = try(local.m313["create_time"], null)
  description = try(local.m313["description"], null)
  device_mo_id = try(local.m313["device_mo_id"], null)
  dn = try(local.m313["dn"], null)
  domain_group_moid = try(local.m313["domain_group_moid"], null)
  id = try(local.m313["id"], null)
  is_upgraded = try(local.m313["is_upgraded"], null)
  mod_time = try(local.m313["mod_time"], null)
  model = try(local.m313["model"], null)
  module_id = try(local.m313["module_id"], null)
  moid = try(local.m313["moid"], null)
  name = try(local.m313["name"], null)
  object_type = try(local.m313["object_type"], null)
  oper_reason = try(local.m313["oper_reason"], null)
  oper_state = try(local.m313["oper_state"], null)
  owners = try(local.m313["owners"], null)
  part_number = try(local.m313["part_number"], null)
  pid = try(local.m313["pid"], null)
  presence = try(local.m313["presence"], null)
  results = try(local.m313["results"], null)
  revision = try(local.m313["revision"], null)
  rn = try(local.m313["rn"], null)
  serial = try(local.m313["serial"], null)
  shared_scope = try(local.m313["shared_scope"], null)
  sku = try(local.m313["sku"], null)
  status = try(local.m313["status"], null)
  tray_id = try(local.m313["tray_id"], null)
  vendor = try(local.m313["vendor"], null)
  vid = try(local.m313["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m313["ancestors"], null) == null ? [] : local.m313["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m313["compute_rack_unit"], null) == null ? [] : local.m313["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m313["equipment_chassis"], null) == null ? [] : local.m313["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_expander_module" {
    for_each = try(local.m313["equipment_expander_module"], null) == null ? [] : local.m313["equipment_expander_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_card" {
    for_each = try(local.m313["equipment_io_card"], null) == null ? [] : local.m313["equipment_io_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_rack_enclosure" {
    for_each = try(local.m313["equipment_rack_enclosure"], null) == null ? [] : local.m313["equipment_rack_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fans" {
    for_each = try(local.m313["fans"], null) == null ? [] : local.m313["fans"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m313["inventory_device_info"], null) == null ? [] : local.m313["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m313["network_element"], null) == null ? [] : local.m313["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m313["parent"], null) == null ? [] : local.m313["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m313["permission_resources"], null) == null ? [] : local.m313["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m313["previous_fru"], null) == null ? [] : local.m313["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m313["registered_device"], null) == null ? [] : local.m313["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m313["tags"], null) == null ? [] : local.m313["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m313["version_context"], null) == null ? [] : local.m313["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
