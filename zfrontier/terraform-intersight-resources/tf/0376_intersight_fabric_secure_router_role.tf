# Sample resource intersight_fabric_secure_router_role — reads ../models/intersight_fabric_secure_router_role.yml
locals { m376 = yamldecode(file("${path.module}/../models/intersight_fabric_secure_router_role.yml"))["intersight_fabric_secure_router_role"] }

resource "intersight_fabric_secure_router_role" "n376" {
  account_moid = try(local.m376["account_moid"], null)
  additional_properties = try(local.m376["additional_properties"], null)
  ancestors = try(local.m376["ancestors"], null)
  class_id = try(local.m376["class_id"], null)
  create_time = try(local.m376["create_time"], null)
  domain_group_moid = try(local.m376["domain_group_moid"], null)
  eth_network_group_policy = try(local.m376["eth_network_group_policy"], null)
  id = try(local.m376["id"], null)
  mod_time = try(local.m376["mod_time"], null)
  moid = try(local.m376["moid"], null)
  node_slot_id = try(local.m376["node_slot_id"], null)
  object_type = try(local.m376["object_type"], null)
  owners = try(local.m376["owners"], null)
  parent = try(local.m376["parent"], null)
  permission_resources = try(local.m376["permission_resources"], null)
  port_policy = try(local.m376["port_policy"], null)
  shared_scope = try(local.m376["shared_scope"], null)
  tags = try(local.m376["tags"], null)
  version_context = try(local.m376["version_context"], null)
}
