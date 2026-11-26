# Sample data source intersight_vnic_eth_network_policy — reads ../models/data_intersight_vnic_eth_network_policy.yml
locals { m1456 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_network_policy.yml"))["data_intersight_vnic_eth_network_policy"] }

data "intersight_vnic_eth_network_policy" "n1456" {
  account_moid = try(local.m1456["account_moid"], null)
  additional_properties = try(local.m1456["additional_properties"], null)
  class_id = try(local.m1456["class_id"], null)
  create_time = try(local.m1456["create_time"], null)
  description = try(local.m1456["description"], null)
  domain_group_moid = try(local.m1456["domain_group_moid"], null)
  id = try(local.m1456["id"], null)
  mod_time = try(local.m1456["mod_time"], null)
  moid = try(local.m1456["moid"], null)
  name = try(local.m1456["name"], null)
  object_type = try(local.m1456["object_type"], null)
  owners = try(local.m1456["owners"], null)
  results = try(local.m1456["results"], null)
  shared_scope = try(local.m1456["shared_scope"], null)
  target_platform = try(local.m1456["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m1456["ancestors"], null) == null ? [] : local.m1456["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1456["organization"], null) == null ? [] : local.m1456["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1456["parent"], null) == null ? [] : local.m1456["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1456["permission_resources"], null) == null ? [] : local.m1456["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1456["tags"], null) == null ? [] : local.m1456["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1456["version_context"], null) == null ? [] : local.m1456["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vlan_settings" {
    for_each = try(local.m1456["vlan_settings"], null) == null ? [] : local.m1456["vlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
