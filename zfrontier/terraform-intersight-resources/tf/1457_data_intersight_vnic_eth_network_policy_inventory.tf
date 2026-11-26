# Sample data source intersight_vnic_eth_network_policy_inventory — reads ../models/data_intersight_vnic_eth_network_policy_inventory.yml
locals { m1457 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_network_policy_inventory.yml"))["data_intersight_vnic_eth_network_policy_inventory"] }

data "intersight_vnic_eth_network_policy_inventory" "n1457" {
  account_moid = try(local.m1457["account_moid"], null)
  additional_properties = try(local.m1457["additional_properties"], null)
  class_id = try(local.m1457["class_id"], null)
  create_time = try(local.m1457["create_time"], null)
  description = try(local.m1457["description"], null)
  device_mo_id = try(local.m1457["device_mo_id"], null)
  domain_group_moid = try(local.m1457["domain_group_moid"], null)
  id = try(local.m1457["id"], null)
  mod_time = try(local.m1457["mod_time"], null)
  moid = try(local.m1457["moid"], null)
  name = try(local.m1457["name"], null)
  object_type = try(local.m1457["object_type"], null)
  owners = try(local.m1457["owners"], null)
  results = try(local.m1457["results"], null)
  shared_scope = try(local.m1457["shared_scope"], null)
  target_platform = try(local.m1457["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m1457["ancestors"], null) == null ? [] : local.m1457["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1457["parent"], null) == null ? [] : local.m1457["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1457["permission_resources"], null) == null ? [] : local.m1457["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1457["tags"], null) == null ? [] : local.m1457["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1457["target_mo"], null) == null ? [] : local.m1457["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1457["version_context"], null) == null ? [] : local.m1457["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vlan_settings" {
    for_each = try(local.m1457["vlan_settings"], null) == null ? [] : local.m1457["vlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
