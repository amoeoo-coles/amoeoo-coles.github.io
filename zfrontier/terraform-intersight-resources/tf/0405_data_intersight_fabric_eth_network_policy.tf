# Sample data source intersight_fabric_eth_network_policy — reads ../models/data_intersight_fabric_eth_network_policy.yml
locals { m405 = yamldecode(file("${path.module}/../models/data_intersight_fabric_eth_network_policy.yml"))["data_intersight_fabric_eth_network_policy"] }

data "intersight_fabric_eth_network_policy" "n405" {
  account_moid = try(local.m405["account_moid"], null)
  additional_properties = try(local.m405["additional_properties"], null)
  class_id = try(local.m405["class_id"], null)
  create_time = try(local.m405["create_time"], null)
  description = try(local.m405["description"], null)
  domain_group_moid = try(local.m405["domain_group_moid"], null)
  id = try(local.m405["id"], null)
  mod_time = try(local.m405["mod_time"], null)
  moid = try(local.m405["moid"], null)
  name = try(local.m405["name"], null)
  object_type = try(local.m405["object_type"], null)
  owners = try(local.m405["owners"], null)
  results = try(local.m405["results"], null)
  shared_scope = try(local.m405["shared_scope"], null)
  target_platform = try(local.m405["target_platform"], null)
  dynamic "ancestors" {
    for_each = try(local.m405["ancestors"], null) == null ? [] : local.m405["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m405["organization"], null) == null ? [] : local.m405["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m405["parent"], null) == null ? [] : local.m405["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m405["permission_resources"], null) == null ? [] : local.m405["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m405["profiles"], null) == null ? [] : local.m405["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m405["tags"], null) == null ? [] : local.m405["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m405["version_context"], null) == null ? [] : local.m405["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
