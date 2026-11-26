# Sample data source intersight_fabric_secure_router_role — reads ../models/data_intersight_fabric_secure_router_role.yml
locals { m430 = yamldecode(file("${path.module}/../models/data_intersight_fabric_secure_router_role.yml"))["data_intersight_fabric_secure_router_role"] }

data "intersight_fabric_secure_router_role" "n430" {
  account_moid = try(local.m430["account_moid"], null)
  additional_properties = try(local.m430["additional_properties"], null)
  class_id = try(local.m430["class_id"], null)
  create_time = try(local.m430["create_time"], null)
  domain_group_moid = try(local.m430["domain_group_moid"], null)
  id = try(local.m430["id"], null)
  mod_time = try(local.m430["mod_time"], null)
  moid = try(local.m430["moid"], null)
  node_slot_id = try(local.m430["node_slot_id"], null)
  object_type = try(local.m430["object_type"], null)
  owners = try(local.m430["owners"], null)
  results = try(local.m430["results"], null)
  shared_scope = try(local.m430["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m430["ancestors"], null) == null ? [] : local.m430["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_group_policy" {
    for_each = try(local.m430["eth_network_group_policy"], null) == null ? [] : local.m430["eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m430["parent"], null) == null ? [] : local.m430["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m430["permission_resources"], null) == null ? [] : local.m430["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m430["port_policy"], null) == null ? [] : local.m430["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m430["tags"], null) == null ? [] : local.m430["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m430["version_context"], null) == null ? [] : local.m430["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
