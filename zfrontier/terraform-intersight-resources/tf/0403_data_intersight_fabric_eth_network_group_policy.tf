# Sample data source intersight_fabric_eth_network_group_policy — reads ../models/data_intersight_fabric_eth_network_group_policy.yml
locals { m403 = yamldecode(file("${path.module}/../models/data_intersight_fabric_eth_network_group_policy.yml"))["data_intersight_fabric_eth_network_group_policy"] }

data "intersight_fabric_eth_network_group_policy" "n403" {
  account_moid = try(local.m403["account_moid"], null)
  additional_properties = try(local.m403["additional_properties"], null)
  class_id = try(local.m403["class_id"], null)
  create_time = try(local.m403["create_time"], null)
  description = try(local.m403["description"], null)
  domain_group_moid = try(local.m403["domain_group_moid"], null)
  id = try(local.m403["id"], null)
  mod_time = try(local.m403["mod_time"], null)
  moid = try(local.m403["moid"], null)
  name = try(local.m403["name"], null)
  object_type = try(local.m403["object_type"], null)
  owners = try(local.m403["owners"], null)
  results = try(local.m403["results"], null)
  shared_scope = try(local.m403["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m403["ancestors"], null) == null ? [] : local.m403["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m403["organization"], null) == null ? [] : local.m403["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m403["parent"], null) == null ? [] : local.m403["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m403["permission_resources"], null) == null ? [] : local.m403["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m403["tags"], null) == null ? [] : local.m403["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m403["version_context"], null) == null ? [] : local.m403["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vlan_settings" {
    for_each = try(local.m403["vlan_settings"], null) == null ? [] : local.m403["vlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
