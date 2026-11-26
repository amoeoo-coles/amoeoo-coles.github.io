# Sample data source intersight_fabric_eth_network_control_policy — reads ../models/data_intersight_fabric_eth_network_control_policy.yml
locals { m401 = yamldecode(file("${path.module}/../models/data_intersight_fabric_eth_network_control_policy.yml"))["data_intersight_fabric_eth_network_control_policy"] }

data "intersight_fabric_eth_network_control_policy" "n401" {
  account_moid = try(local.m401["account_moid"], null)
  additional_properties = try(local.m401["additional_properties"], null)
  cdp_enabled = try(local.m401["cdp_enabled"], null)
  class_id = try(local.m401["class_id"], null)
  create_time = try(local.m401["create_time"], null)
  description = try(local.m401["description"], null)
  domain_group_moid = try(local.m401["domain_group_moid"], null)
  forge_mac = try(local.m401["forge_mac"], null)
  id = try(local.m401["id"], null)
  mac_registration_mode = try(local.m401["mac_registration_mode"], null)
  mod_time = try(local.m401["mod_time"], null)
  moid = try(local.m401["moid"], null)
  name = try(local.m401["name"], null)
  object_type = try(local.m401["object_type"], null)
  owners = try(local.m401["owners"], null)
  results = try(local.m401["results"], null)
  shared_scope = try(local.m401["shared_scope"], null)
  uplink_fail_action = try(local.m401["uplink_fail_action"], null)
  dynamic "ancestors" {
    for_each = try(local.m401["ancestors"], null) == null ? [] : local.m401["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lldp_settings" {
    for_each = try(local.m401["lldp_settings"], null) == null ? [] : local.m401["lldp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_policy" {
    for_each = try(local.m401["network_policy"], null) == null ? [] : local.m401["network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m401["organization"], null) == null ? [] : local.m401["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m401["parent"], null) == null ? [] : local.m401["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m401["permission_resources"], null) == null ? [] : local.m401["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m401["tags"], null) == null ? [] : local.m401["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m401["version_context"], null) == null ? [] : local.m401["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
