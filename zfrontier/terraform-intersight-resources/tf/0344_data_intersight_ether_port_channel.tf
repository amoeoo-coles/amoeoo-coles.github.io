# Sample data source intersight_ether_port_channel — reads ../models/data_intersight_ether_port_channel.yml
locals { m344 = yamldecode(file("${path.module}/../models/data_intersight_ether_port_channel.yml"))["data_intersight_ether_port_channel"] }

data "intersight_ether_port_channel" "n344" {
  access_vlan = try(local.m344["access_vlan"], null)
  account_moid = try(local.m344["account_moid"], null)
  additional_properties = try(local.m344["additional_properties"], null)
  admin_state = try(local.m344["admin_state"], null)
  allowed_vlans = try(local.m344["allowed_vlans"], null)
  band_width = try(local.m344["band_width"], null)
  class_id = try(local.m344["class_id"], null)
  create_time = try(local.m344["create_time"], null)
  description = try(local.m344["description"], null)
  device_mo_id = try(local.m344["device_mo_id"], null)
  dn = try(local.m344["dn"], null)
  domain_group_moid = try(local.m344["domain_group_moid"], null)
  id = try(local.m344["id"], null)
  ip_address = try(local.m344["ip_address"], null)
  ip_address_mask = try(local.m344["ip_address_mask"], null)
  ipv6_subnet_cidr = try(local.m344["ipv6_subnet_cidr"], null)
  mac_address = try(local.m344["mac_address"], null)
  mod_time = try(local.m344["mod_time"], null)
  mode = try(local.m344["mode"], null)
  moid = try(local.m344["moid"], null)
  mtu = try(local.m344["mtu"], null)
  name = try(local.m344["name"], null)
  native_vlan = try(local.m344["native_vlan"], null)
  object_type = try(local.m344["object_type"], null)
  oper_speed = try(local.m344["oper_speed"], null)
  oper_state = try(local.m344["oper_state"], null)
  oper_state_qual = try(local.m344["oper_state_qual"], null)
  oper_vlans = try(local.m344["oper_vlans"], null)
  owners = try(local.m344["owners"], null)
  port_channel_id = try(local.m344["port_channel_id"], null)
  results = try(local.m344["results"], null)
  rn = try(local.m344["rn"], null)
  role = try(local.m344["role"], null)
  shared_scope = try(local.m344["shared_scope"], null)
  status = try(local.m344["status"], null)
  switch_id = try(local.m344["switch_id"], null)
  user_label = try(local.m344["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m344["ancestors"], null) == null ? [] : local.m344["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_switch_card" {
    for_each = try(local.m344["equipment_switch_card"], null) == null ? [] : local.m344["equipment_switch_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m344["network_element"], null) == null ? [] : local.m344["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m344["parent"], null) == null ? [] : local.m344["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m344["permission_resources"], null) == null ? [] : local.m344["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m344["registered_device"], null) == null ? [] : local.m344["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m344["tags"], null) == null ? [] : local.m344["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m344["version_context"], null) == null ? [] : local.m344["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
