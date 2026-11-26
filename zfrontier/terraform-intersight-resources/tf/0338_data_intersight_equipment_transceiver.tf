# Sample data source intersight_equipment_transceiver — reads ../models/data_intersight_equipment_transceiver.yml
locals { m338 = yamldecode(file("${path.module}/../models/data_intersight_equipment_transceiver.yml"))["data_intersight_equipment_transceiver"] }

data "intersight_equipment_transceiver" "n338" {
  account_moid = try(local.m338["account_moid"], null)
  additional_properties = try(local.m338["additional_properties"], null)
  aggregate_port_id = try(local.m338["aggregate_port_id"], null)
  cisco_extended_id_number = try(local.m338["cisco_extended_id_number"], null)
  class_id = try(local.m338["class_id"], null)
  create_time = try(local.m338["create_time"], null)
  device_mo_id = try(local.m338["device_mo_id"], null)
  dn = try(local.m338["dn"], null)
  domain_group_moid = try(local.m338["domain_group_moid"], null)
  id = try(local.m338["id"], null)
  interface_type = try(local.m338["interface_type"], null)
  is_upgraded = try(local.m338["is_upgraded"], null)
  manufacturer_part_number = try(local.m338["manufacturer_part_number"], null)
  mod_time = try(local.m338["mod_time"], null)
  model = try(local.m338["model"], null)
  module_id = try(local.m338["module_id"], null)
  moid = try(local.m338["moid"], null)
  name = try(local.m338["name"], null)
  object_type = try(local.m338["object_type"], null)
  oper_speed = try(local.m338["oper_speed"], null)
  oper_state = try(local.m338["oper_state"], null)
  oper_state_qual = try(local.m338["oper_state_qual"], null)
  owners = try(local.m338["owners"], null)
  port_id = try(local.m338["port_id"], null)
  presence = try(local.m338["presence"], null)
  results = try(local.m338["results"], null)
  revision = try(local.m338["revision"], null)
  rn = try(local.m338["rn"], null)
  serial = try(local.m338["serial"], null)
  shared_scope = try(local.m338["shared_scope"], null)
  slot_id = try(local.m338["slot_id"], null)
  status = try(local.m338["status"], null)
  switch_id = try(local.m338["switch_id"], null)
  type = try(local.m338["type"], null)
  vendor = try(local.m338["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m338["ancestors"], null) == null ? [] : local.m338["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_host_port" {
    for_each = try(local.m338["ether_host_port"], null) == null ? [] : local.m338["ether_host_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ether_physical_port" {
    for_each = try(local.m338["ether_physical_port"], null) == null ? [] : local.m338["ether_physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_physical_port" {
    for_each = try(local.m338["fc_physical_port"], null) == null ? [] : local.m338["fc_physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m338["parent"], null) == null ? [] : local.m338["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m338["permission_resources"], null) == null ? [] : local.m338["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m338["previous_fru"], null) == null ? [] : local.m338["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m338["registered_device"], null) == null ? [] : local.m338["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sfp_firmware_info" {
    for_each = try(local.m338["sfp_firmware_info"], null) == null ? [] : local.m338["sfp_firmware_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m338["tags"], null) == null ? [] : local.m338["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m338["version_context"], null) == null ? [] : local.m338["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
