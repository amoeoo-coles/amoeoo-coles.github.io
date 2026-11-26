# Sample data source intersight_fabric_vlan_set — reads ../models/data_intersight_fabric_vlan_set.yml
locals { m449 = yamldecode(file("${path.module}/../models/data_intersight_fabric_vlan_set.yml"))["data_intersight_fabric_vlan_set"] }

data "intersight_fabric_vlan_set" "n449" {
  account_moid = try(local.m449["account_moid"], null)
  additional_properties = try(local.m449["additional_properties"], null)
  auto_allow_on_inter_switch_ports = try(local.m449["auto_allow_on_inter_switch_ports"], null)
  auto_allow_on_secure_router_roles = try(local.m449["auto_allow_on_secure_router_roles"], null)
  auto_allow_on_uplinks = try(local.m449["auto_allow_on_uplinks"], null)
  class_id = try(local.m449["class_id"], null)
  create_time = try(local.m449["create_time"], null)
  domain_group_moid = try(local.m449["domain_group_moid"], null)
  id = try(local.m449["id"], null)
  is_native = try(local.m449["is_native"], null)
  mod_time = try(local.m449["mod_time"], null)
  moid = try(local.m449["moid"], null)
  name = try(local.m449["name"], null)
  object_type = try(local.m449["object_type"], null)
  owners = try(local.m449["owners"], null)
  primary_vlan_id = try(local.m449["primary_vlan_id"], null)
  results = try(local.m449["results"], null)
  shared_scope = try(local.m449["shared_scope"], null)
  sharing_type = try(local.m449["sharing_type"], null)
  vlans = try(local.m449["vlans"], null)
  dynamic "ancestors" {
    for_each = try(local.m449["ancestors"], null) == null ? [] : local.m449["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_policy" {
    for_each = try(local.m449["eth_network_policy"], null) == null ? [] : local.m449["eth_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "multicast_policy" {
    for_each = try(local.m449["multicast_policy"], null) == null ? [] : local.m449["multicast_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m449["parent"], null) == null ? [] : local.m449["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m449["permission_resources"], null) == null ? [] : local.m449["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m449["tags"], null) == null ? [] : local.m449["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m449["version_context"], null) == null ? [] : local.m449["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
