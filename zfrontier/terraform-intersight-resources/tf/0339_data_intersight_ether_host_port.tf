# Sample data source intersight_ether_host_port — reads ../models/data_intersight_ether_host_port.yml
locals { m339 = yamldecode(file("${path.module}/../models/data_intersight_ether_host_port.yml"))["data_intersight_ether_host_port"] }

data "intersight_ether_host_port" "n339" {
  access_vlan = try(local.m339["access_vlan"], null)
  account_moid = try(local.m339["account_moid"], null)
  additional_properties = try(local.m339["additional_properties"], null)
  admin_fec = try(local.m339["admin_fec"], null)
  admin_state = try(local.m339["admin_state"], null)
  aggregate_port_id = try(local.m339["aggregate_port_id"], null)
  allowed_vlans = try(local.m339["allowed_vlans"], null)
  class_id = try(local.m339["class_id"], null)
  create_time = try(local.m339["create_time"], null)
  device_mo_id = try(local.m339["device_mo_id"], null)
  dn = try(local.m339["dn"], null)
  domain_group_moid = try(local.m339["domain_group_moid"], null)
  id = try(local.m339["id"], null)
  mac_address = try(local.m339["mac_address"], null)
  mod_time = try(local.m339["mod_time"], null)
  mode = try(local.m339["mode"], null)
  module_id = try(local.m339["module_id"], null)
  moid = try(local.m339["moid"], null)
  native_vlan = try(local.m339["native_vlan"], null)
  object_type = try(local.m339["object_type"], null)
  oper_fec = try(local.m339["oper_fec"], null)
  oper_speed = try(local.m339["oper_speed"], null)
  oper_state = try(local.m339["oper_state"], null)
  oper_state_qual = try(local.m339["oper_state_qual"], null)
  oper_vlans = try(local.m339["oper_vlans"], null)
  owners = try(local.m339["owners"], null)
  peer_dn = try(local.m339["peer_dn"], null)
  port_channel_id = try(local.m339["port_channel_id"], null)
  port_id = try(local.m339["port_id"], null)
  port_name = try(local.m339["port_name"], null)
  port_type = try(local.m339["port_type"], null)
  results = try(local.m339["results"], null)
  rn = try(local.m339["rn"], null)
  role = try(local.m339["role"], null)
  shared_scope = try(local.m339["shared_scope"], null)
  slot_id = try(local.m339["slot_id"], null)
  speed = try(local.m339["speed"], null)
  switch_id = try(local.m339["switch_id"], null)
  transceiver_type = try(local.m339["transceiver_type"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m339["acknowledged_peer_interface"], null) == null ? [] : local.m339["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m339["ancestors"], null) == null ? [] : local.m339["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_card_base" {
    for_each = try(local.m339["equipment_io_card_base"], null) == null ? [] : local.m339["equipment_io_card_base"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m339["equipment_switch_card"], null) == null ? [] : local.m339["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m339["parent"], null) == null ? [] : local.m339["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m339["peer_interface"], null) == null ? [] : local.m339["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface_compatibility_issues" {
    for_each = try(local.m339["peer_interface_compatibility_issues"], null) == null ? [] : local.m339["peer_interface_compatibility_issues"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m339["permission_resources"], null) == null ? [] : local.m339["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m339["registered_device"], null) == null ? [] : local.m339["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m339["tags"], null) == null ? [] : local.m339["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m339["version_context"], null) == null ? [] : local.m339["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
