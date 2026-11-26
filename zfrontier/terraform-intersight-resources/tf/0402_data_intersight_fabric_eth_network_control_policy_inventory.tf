# Sample data source intersight_fabric_eth_network_control_policy_inventory — reads ../models/data_intersight_fabric_eth_network_control_policy_inventory.yml
locals { m402 = yamldecode(file("${path.module}/../models/data_intersight_fabric_eth_network_control_policy_inventory.yml"))["data_intersight_fabric_eth_network_control_policy_inventory"] }

data "intersight_fabric_eth_network_control_policy_inventory" "n402" {
  account_moid = try(local.m402["account_moid"], null)
  additional_properties = try(local.m402["additional_properties"], null)
  cdp_enabled = try(local.m402["cdp_enabled"], null)
  class_id = try(local.m402["class_id"], null)
  create_time = try(local.m402["create_time"], null)
  description = try(local.m402["description"], null)
  device_mo_id = try(local.m402["device_mo_id"], null)
  domain_group_moid = try(local.m402["domain_group_moid"], null)
  forge_mac = try(local.m402["forge_mac"], null)
  id = try(local.m402["id"], null)
  mac_registration_mode = try(local.m402["mac_registration_mode"], null)
  mod_time = try(local.m402["mod_time"], null)
  moid = try(local.m402["moid"], null)
  name = try(local.m402["name"], null)
  object_type = try(local.m402["object_type"], null)
  owners = try(local.m402["owners"], null)
  results = try(local.m402["results"], null)
  shared_scope = try(local.m402["shared_scope"], null)
  uplink_fail_action = try(local.m402["uplink_fail_action"], null)
  dynamic "ancestors" {
    for_each = try(local.m402["ancestors"], null) == null ? [] : local.m402["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lldp_settings" {
    for_each = try(local.m402["lldp_settings"], null) == null ? [] : local.m402["lldp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_policy" {
    for_each = try(local.m402["network_policy"], null) == null ? [] : local.m402["network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m402["parent"], null) == null ? [] : local.m402["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m402["permission_resources"], null) == null ? [] : local.m402["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m402["tags"], null) == null ? [] : local.m402["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m402["target_mo"], null) == null ? [] : local.m402["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m402["version_context"], null) == null ? [] : local.m402["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
