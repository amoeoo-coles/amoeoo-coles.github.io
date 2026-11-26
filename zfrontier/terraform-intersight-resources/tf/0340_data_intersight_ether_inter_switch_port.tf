# Sample data source intersight_ether_inter_switch_port — reads ../models/data_intersight_ether_inter_switch_port.yml
locals { m340 = yamldecode(file("${path.module}/../models/data_intersight_ether_inter_switch_port.yml"))["data_intersight_ether_inter_switch_port"] }

data "intersight_ether_inter_switch_port" "n340" {
  access_vlan = try(local.m340["access_vlan"], null)
  account_moid = try(local.m340["account_moid"], null)
  additional_properties = try(local.m340["additional_properties"], null)
  admin_fec = try(local.m340["admin_fec"], null)
  admin_state = try(local.m340["admin_state"], null)
  allowed_vlans = try(local.m340["allowed_vlans"], null)
  class_id = try(local.m340["class_id"], null)
  create_time = try(local.m340["create_time"], null)
  device_mo_id = try(local.m340["device_mo_id"], null)
  dn = try(local.m340["dn"], null)
  domain_group_moid = try(local.m340["domain_group_moid"], null)
  id = try(local.m340["id"], null)
  mac_address = try(local.m340["mac_address"], null)
  mod_time = try(local.m340["mod_time"], null)
  mode = try(local.m340["mode"], null)
  moid = try(local.m340["moid"], null)
  native_vlan = try(local.m340["native_vlan"], null)
  object_type = try(local.m340["object_type"], null)
  oper_fec = try(local.m340["oper_fec"], null)
  oper_speed = try(local.m340["oper_speed"], null)
  oper_state = try(local.m340["oper_state"], null)
  oper_state_qual = try(local.m340["oper_state_qual"], null)
  oper_vlans = try(local.m340["oper_vlans"], null)
  owners = try(local.m340["owners"], null)
  peer_dn = try(local.m340["peer_dn"], null)
  port_id = try(local.m340["port_id"], null)
  port_name = try(local.m340["port_name"], null)
  results = try(local.m340["results"], null)
  rn = try(local.m340["rn"], null)
  role = try(local.m340["role"], null)
  shared_scope = try(local.m340["shared_scope"], null)
  slot_id = try(local.m340["slot_id"], null)
  speed = try(local.m340["speed"], null)
  switch_id = try(local.m340["switch_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m340["ancestors"], null) == null ? [] : local.m340["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m340["equipment_switch_card"], null) == null ? [] : local.m340["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m340["parent"], null) == null ? [] : local.m340["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m340["peer_interface"], null) == null ? [] : local.m340["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m340["permission_resources"], null) == null ? [] : local.m340["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m340["registered_device"], null) == null ? [] : local.m340["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m340["tags"], null) == null ? [] : local.m340["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m340["version_context"], null) == null ? [] : local.m340["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
