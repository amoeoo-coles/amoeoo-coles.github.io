# Sample data source intersight_network_interface_list — reads ../models/data_intersight_network_interface_list.yml
locals { m867 = yamldecode(file("${path.module}/../models/data_intersight_network_interface_list.yml"))["data_intersight_network_interface_list"] }

data "intersight_network_interface_list" "n867" {
  account_moid = try(local.m867["account_moid"], null)
  additional_properties = try(local.m867["additional_properties"], null)
  admin_state = try(local.m867["admin_state"], null)
  allowed_vlans = try(local.m867["allowed_vlans"], null)
  class_id = try(local.m867["class_id"], null)
  create_time = try(local.m867["create_time"], null)
  description = try(local.m867["description"], null)
  device_mo_id = try(local.m867["device_mo_id"], null)
  display_name = try(local.m867["display_name"], null)
  dn = try(local.m867["dn"], null)
  domain_group_moid = try(local.m867["domain_group_moid"], null)
  id = try(local.m867["id"], null)
  ip_address = try(local.m867["ip_address"], null)
  ip_subnet = try(local.m867["ip_subnet"], null)
  mac = try(local.m867["mac"], null)
  mod_time = try(local.m867["mod_time"], null)
  moid = try(local.m867["moid"], null)
  mtu = try(local.m867["mtu"], null)
  name = try(local.m867["name"], null)
  object_type = try(local.m867["object_type"], null)
  oper_state = try(local.m867["oper_state"], null)
  owners = try(local.m867["owners"], null)
  port_channel_id = try(local.m867["port_channel_id"], null)
  port_sub_type = try(local.m867["port_sub_type"], null)
  port_type = try(local.m867["port_type"], null)
  results = try(local.m867["results"], null)
  rn = try(local.m867["rn"], null)
  shared_scope = try(local.m867["shared_scope"], null)
  slot_id = try(local.m867["slot_id"], null)
  speed = try(local.m867["speed"], null)
  speed_group = try(local.m867["speed_group"], null)
  vlan = try(local.m867["vlan"], null)
  dynamic "ancestors" {
    for_each = try(local.m867["ancestors"], null) == null ? [] : local.m867["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m867["network_element"], null) == null ? [] : local.m867["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m867["parent"], null) == null ? [] : local.m867["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m867["permission_resources"], null) == null ? [] : local.m867["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m867["registered_device"], null) == null ? [] : local.m867["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m867["tags"], null) == null ? [] : local.m867["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m867["version_context"], null) == null ? [] : local.m867["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
