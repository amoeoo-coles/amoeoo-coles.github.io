# Sample data source intersight_network_discovered_neighbor — reads ../models/data_intersight_network_discovered_neighbor.yml
locals { m861 = yamldecode(file("${path.module}/../models/data_intersight_network_discovered_neighbor.yml"))["data_intersight_network_discovered_neighbor"] }

data "intersight_network_discovered_neighbor" "n861" {
  account_moid = try(local.m861["account_moid"], null)
  additional_properties = try(local.m861["additional_properties"], null)
  class_id = try(local.m861["class_id"], null)
  create_time = try(local.m861["create_time"], null)
  device_id = try(local.m861["device_id"], null)
  device_mo_id = try(local.m861["device_mo_id"], null)
  dn = try(local.m861["dn"], null)
  domain_group_moid = try(local.m861["domain_group_moid"], null)
  id = try(local.m861["id"], null)
  management_address = try(local.m861["management_address"], null)
  mod_time = try(local.m861["mod_time"], null)
  moid = try(local.m861["moid"], null)
  neighbor_capability = try(local.m861["neighbor_capability"], null)
  neighbor_description = try(local.m861["neighbor_description"], null)
  neighbor_device_capability = try(local.m861["neighbor_device_capability"], null)
  neighbor_device_id = try(local.m861["neighbor_device_id"], null)
  neighbor_interface = try(local.m861["neighbor_interface"], null)
  neighbor_mac_address = try(local.m861["neighbor_mac_address"], null)
  neighbor_model = try(local.m861["neighbor_model"], null)
  neighbor_native_vlan = try(local.m861["neighbor_native_vlan"], null)
  neighbor_port_id = try(local.m861["neighbor_port_id"], null)
  neighbor_serial = try(local.m861["neighbor_serial"], null)
  neighbor_type = try(local.m861["neighbor_type"], null)
  neighbor_vendor = try(local.m861["neighbor_vendor"], null)
  neighbor_version = try(local.m861["neighbor_version"], null)
  object_type = try(local.m861["object_type"], null)
  owners = try(local.m861["owners"], null)
  results = try(local.m861["results"], null)
  rn = try(local.m861["rn"], null)
  shared_scope = try(local.m861["shared_scope"], null)
  switch_port_id = try(local.m861["switch_port_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m861["ancestors"], null) == null ? [] : local.m861["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cdp_neighbor" {
    for_each = try(local.m861["cdp_neighbor"], null) == null ? [] : local.m861["cdp_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lldp_neighbor" {
    for_each = try(local.m861["lldp_neighbor"], null) == null ? [] : local.m861["lldp_neighbor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m861["parent"], null) == null ? [] : local.m861["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m861["permission_resources"], null) == null ? [] : local.m861["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_port" {
    for_each = try(local.m861["physical_port"], null) == null ? [] : local.m861["physical_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m861["tags"], null) == null ? [] : local.m861["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m861["version_context"], null) == null ? [] : local.m861["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
