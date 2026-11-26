# Sample data source intersight_ether_physical_port — reads ../models/data_intersight_ether_physical_port.yml
locals { m343 = yamldecode(file("${path.module}/../models/data_intersight_ether_physical_port.yml"))["data_intersight_ether_physical_port"] }

data "intersight_ether_physical_port" "n343" {
  access_vlan = try(local.m343["access_vlan"], null)
  account_moid = try(local.m343["account_moid"], null)
  additional_properties = try(local.m343["additional_properties"], null)
  admin_fec = try(local.m343["admin_fec"], null)
  admin_speed = try(local.m343["admin_speed"], null)
  admin_state = try(local.m343["admin_state"], null)
  aggregate_port_id = try(local.m343["aggregate_port_id"], null)
  allowed_vlans = try(local.m343["allowed_vlans"], null)
  class_id = try(local.m343["class_id"], null)
  create_time = try(local.m343["create_time"], null)
  device_mo_id = try(local.m343["device_mo_id"], null)
  dn = try(local.m343["dn"], null)
  domain_group_moid = try(local.m343["domain_group_moid"], null)
  id = try(local.m343["id"], null)
  license_grace = try(local.m343["license_grace"], null)
  license_state = try(local.m343["license_state"], null)
  mac_address = try(local.m343["mac_address"], null)
  mod_time = try(local.m343["mod_time"], null)
  mode = try(local.m343["mode"], null)
  moid = try(local.m343["moid"], null)
  name = try(local.m343["name"], null)
  native_vlan = try(local.m343["native_vlan"], null)
  object_type = try(local.m343["object_type"], null)
  oper_fec = try(local.m343["oper_fec"], null)
  oper_speed = try(local.m343["oper_speed"], null)
  oper_state = try(local.m343["oper_state"], null)
  oper_state_qual = try(local.m343["oper_state_qual"], null)
  oper_vlans = try(local.m343["oper_vlans"], null)
  owners = try(local.m343["owners"], null)
  peer_dn = try(local.m343["peer_dn"], null)
  port_channel_id = try(local.m343["port_channel_id"], null)
  port_id = try(local.m343["port_id"], null)
  port_name = try(local.m343["port_name"], null)
  port_type = try(local.m343["port_type"], null)
  results = try(local.m343["results"], null)
  rn = try(local.m343["rn"], null)
  role = try(local.m343["role"], null)
  shared_scope = try(local.m343["shared_scope"], null)
  slot_id = try(local.m343["slot_id"], null)
  switch_id = try(local.m343["switch_id"], null)
  transceiver_type = try(local.m343["transceiver_type"], null)
  user_label = try(local.m343["user_label"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m343["acknowledged_peer_interface"], null) == null ? [] : local.m343["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m343["ancestors"], null) == null ? [] : local.m343["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m343["inventory_device_info"], null) == null ? [] : local.m343["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "macsec_oper_data" {
    for_each = try(local.m343["macsec_oper_data"], null) == null ? [] : local.m343["macsec_oper_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m343["parent"], null) == null ? [] : local.m343["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m343["peer_interface"], null) == null ? [] : local.m343["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m343["permission_resources"], null) == null ? [] : local.m343["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_group" {
    for_each = try(local.m343["port_group"], null) == null ? [] : local.m343["port_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_sub_group" {
    for_each = try(local.m343["port_sub_group"], null) == null ? [] : local.m343["port_sub_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m343["registered_device"], null) == null ? [] : local.m343["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m343["tags"], null) == null ? [] : local.m343["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m343["version_context"], null) == null ? [] : local.m343["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
