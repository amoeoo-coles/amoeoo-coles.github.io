# Sample data source intersight_network_vlan_port_info — reads ../models/data_intersight_network_vlan_port_info.yml
locals { m876 = yamldecode(file("${path.module}/../models/data_intersight_network_vlan_port_info.yml"))["data_intersight_network_vlan_port_info"] }

data "intersight_network_vlan_port_info" "n876" {
  access_vlan_port_count = try(local.m876["access_vlan_port_count"], null)
  account_moid = try(local.m876["account_moid"], null)
  additional_properties = try(local.m876["additional_properties"], null)
  border_vlan_port_count = try(local.m876["border_vlan_port_count"], null)
  class_id = try(local.m876["class_id"], null)
  compressed_optimization_sets_value = try(local.m876["compressed_optimization_sets_value"], null)
  compressed_vlan_port_count = try(local.m876["compressed_vlan_port_count"], null)
  compressed_vlan_port_count_value = try(local.m876["compressed_vlan_port_count_value"], null)
  create_time = try(local.m876["create_time"], null)
  device_mo_id = try(local.m876["device_mo_id"], null)
  dn = try(local.m876["dn"], null)
  domain_group_moid = try(local.m876["domain_group_moid"], null)
  id = try(local.m876["id"], null)
  mod_time = try(local.m876["mod_time"], null)
  moid = try(local.m876["moid"], null)
  object_type = try(local.m876["object_type"], null)
  owners = try(local.m876["owners"], null)
  results = try(local.m876["results"], null)
  rn = try(local.m876["rn"], null)
  shared_scope = try(local.m876["shared_scope"], null)
  total_vlan_port_count = try(local.m876["total_vlan_port_count"], null)
  uncompressed_vlan_port_count = try(local.m876["uncompressed_vlan_port_count"], null)
  uncompressed_vlan_port_count_value = try(local.m876["uncompressed_vlan_port_count_value"], null)
  vlan_port_limit = try(local.m876["vlan_port_limit"], null)
  dynamic "ancestors" {
    for_each = try(local.m876["ancestors"], null) == null ? [] : local.m876["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m876["inventory_device_info"], null) == null ? [] : local.m876["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m876["network_element"], null) == null ? [] : local.m876["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m876["parent"], null) == null ? [] : local.m876["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m876["permission_resources"], null) == null ? [] : local.m876["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m876["registered_device"], null) == null ? [] : local.m876["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m876["tags"], null) == null ? [] : local.m876["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m876["version_context"], null) == null ? [] : local.m876["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
