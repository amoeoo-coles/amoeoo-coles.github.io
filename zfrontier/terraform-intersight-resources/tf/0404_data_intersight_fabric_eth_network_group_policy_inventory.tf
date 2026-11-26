# Sample data source intersight_fabric_eth_network_group_policy_inventory — reads ../models/data_intersight_fabric_eth_network_group_policy_inventory.yml
locals { m404 = yamldecode(file("${path.module}/../models/data_intersight_fabric_eth_network_group_policy_inventory.yml"))["data_intersight_fabric_eth_network_group_policy_inventory"] }

data "intersight_fabric_eth_network_group_policy_inventory" "n404" {
  account_moid = try(local.m404["account_moid"], null)
  additional_properties = try(local.m404["additional_properties"], null)
  class_id = try(local.m404["class_id"], null)
  create_time = try(local.m404["create_time"], null)
  description = try(local.m404["description"], null)
  device_mo_id = try(local.m404["device_mo_id"], null)
  domain_group_moid = try(local.m404["domain_group_moid"], null)
  id = try(local.m404["id"], null)
  mod_time = try(local.m404["mod_time"], null)
  moid = try(local.m404["moid"], null)
  name = try(local.m404["name"], null)
  object_type = try(local.m404["object_type"], null)
  owners = try(local.m404["owners"], null)
  results = try(local.m404["results"], null)
  shared_scope = try(local.m404["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m404["ancestors"], null) == null ? [] : local.m404["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m404["parent"], null) == null ? [] : local.m404["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m404["permission_resources"], null) == null ? [] : local.m404["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m404["tags"], null) == null ? [] : local.m404["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m404["target_mo"], null) == null ? [] : local.m404["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m404["version_context"], null) == null ? [] : local.m404["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vlan_settings" {
    for_each = try(local.m404["vlan_settings"], null) == null ? [] : local.m404["vlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
