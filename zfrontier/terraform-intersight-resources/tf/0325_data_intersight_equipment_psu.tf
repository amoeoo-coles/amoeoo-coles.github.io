# Sample data source intersight_equipment_psu — reads ../models/data_intersight_equipment_psu.yml
locals { m325 = yamldecode(file("${path.module}/../models/data_intersight_equipment_psu.yml"))["data_intersight_equipment_psu"] }

data "intersight_equipment_psu" "n325" {
  account_moid = try(local.m325["account_moid"], null)
  additional_properties = try(local.m325["additional_properties"], null)
  class_id = try(local.m325["class_id"], null)
  create_time = try(local.m325["create_time"], null)
  description = try(local.m325["description"], null)
  device_mo_id = try(local.m325["device_mo_id"], null)
  dn = try(local.m325["dn"], null)
  domain_group_moid = try(local.m325["domain_group_moid"], null)
  id = try(local.m325["id"], null)
  is_upgraded = try(local.m325["is_upgraded"], null)
  mod_time = try(local.m325["mod_time"], null)
  model = try(local.m325["model"], null)
  moid = try(local.m325["moid"], null)
  name = try(local.m325["name"], null)
  object_type = try(local.m325["object_type"], null)
  oper_reason = try(local.m325["oper_reason"], null)
  oper_state = try(local.m325["oper_state"], null)
  owners = try(local.m325["owners"], null)
  part_number = try(local.m325["part_number"], null)
  pid = try(local.m325["pid"], null)
  presence = try(local.m325["presence"], null)
  psu_fw_version = try(local.m325["psu_fw_version"], null)
  psu_id = try(local.m325["psu_id"], null)
  psu_input_src = try(local.m325["psu_input_src"], null)
  psu_type = try(local.m325["psu_type"], null)
  psu_wattage = try(local.m325["psu_wattage"], null)
  results = try(local.m325["results"], null)
  revision = try(local.m325["revision"], null)
  rn = try(local.m325["rn"], null)
  serial = try(local.m325["serial"], null)
  shared_scope = try(local.m325["shared_scope"], null)
  sku = try(local.m325["sku"], null)
  spare_status = try(local.m325["spare_status"], null)
  vendor = try(local.m325["vendor"], null)
  vid = try(local.m325["vid"], null)
  voltage = try(local.m325["voltage"], null)
  dynamic "ancestors" {
    for_each = try(local.m325["ancestors"], null) == null ? [] : local.m325["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m325["compute_rack_unit"], null) == null ? [] : local.m325["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m325["equipment_chassis"], null) == null ? [] : local.m325["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_fex" {
    for_each = try(local.m325["equipment_fex"], null) == null ? [] : local.m325["equipment_fex"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_rack_enclosure" {
    for_each = try(local.m325["equipment_rack_enclosure"], null) == null ? [] : local.m325["equipment_rack_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "firmware_running_firmwares" {
    for_each = try(local.m325["firmware_running_firmwares"], null) == null ? [] : local.m325["firmware_running_firmwares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m325["inventory_device_info"], null) == null ? [] : local.m325["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m325["network_element"], null) == null ? [] : local.m325["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m325["parent"], null) == null ? [] : local.m325["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m325["permission_resources"], null) == null ? [] : local.m325["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m325["previous_fru"], null) == null ? [] : local.m325["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m325["registered_device"], null) == null ? [] : local.m325["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m325["tags"], null) == null ? [] : local.m325["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m325["version_context"], null) == null ? [] : local.m325["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
