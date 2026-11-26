# Sample data source intersight_equipment_enclosure_element — reads ../models/data_intersight_equipment_enclosure_element.yml
locals { m306 = yamldecode(file("${path.module}/../models/data_intersight_equipment_enclosure_element.yml"))["data_intersight_equipment_enclosure_element"] }

data "intersight_equipment_enclosure_element" "n306" {
  account_moid = try(local.m306["account_moid"], null)
  additional_properties = try(local.m306["additional_properties"], null)
  class_id = try(local.m306["class_id"], null)
  create_time = try(local.m306["create_time"], null)
  description = try(local.m306["description"], null)
  device_mo_id = try(local.m306["device_mo_id"], null)
  dn = try(local.m306["dn"], null)
  domain_group_moid = try(local.m306["domain_group_moid"], null)
  enclosure_id = try(local.m306["enclosure_id"], null)
  id = try(local.m306["id"], null)
  is_upgraded = try(local.m306["is_upgraded"], null)
  mod_time = try(local.m306["mod_time"], null)
  model = try(local.m306["model"], null)
  moid = try(local.m306["moid"], null)
  name = try(local.m306["name"], null)
  object_type = try(local.m306["object_type"], null)
  oper_reason = try(local.m306["oper_reason"], null)
  oper_state = try(local.m306["oper_state"], null)
  owners = try(local.m306["owners"], null)
  part_number = try(local.m306["part_number"], null)
  pid = try(local.m306["pid"], null)
  presence = try(local.m306["presence"], null)
  results = try(local.m306["results"], null)
  revision = try(local.m306["revision"], null)
  rn = try(local.m306["rn"], null)
  serial = try(local.m306["serial"], null)
  shared_scope = try(local.m306["shared_scope"], null)
  sku = try(local.m306["sku"], null)
  status = try(local.m306["status"], null)
  type = try(local.m306["type"], null)
  vendor = try(local.m306["vendor"], null)
  vid = try(local.m306["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m306["ancestors"], null) == null ? [] : local.m306["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m306["compute_rack_unit"], null) == null ? [] : local.m306["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "firmware_running_firmwares" {
    for_each = try(local.m306["firmware_running_firmwares"], null) == null ? [] : local.m306["firmware_running_firmwares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m306["graphics_cards"], null) == null ? [] : local.m306["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m306["parent"], null) == null ? [] : local.m306["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m306["permission_resources"], null) == null ? [] : local.m306["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m306["previous_fru"], null) == null ? [] : local.m306["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m306["registered_device"], null) == null ? [] : local.m306["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m306["tags"], null) == null ? [] : local.m306["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m306["version_context"], null) == null ? [] : local.m306["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
