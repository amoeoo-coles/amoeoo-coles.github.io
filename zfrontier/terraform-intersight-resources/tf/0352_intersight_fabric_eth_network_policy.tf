# Sample resource intersight_fabric_eth_network_policy — reads ../models/intersight_fabric_eth_network_policy.yml
locals { m352 = yamldecode(file("${path.module}/../models/intersight_fabric_eth_network_policy.yml"))["intersight_fabric_eth_network_policy"] }

resource "intersight_fabric_eth_network_policy" "n352" {
  account_moid = try(local.m352["account_moid"], null)
  additional_properties = try(local.m352["additional_properties"], null)
  ancestors = try(local.m352["ancestors"], null)
  class_id = try(local.m352["class_id"], null)
  create_time = try(local.m352["create_time"], null)
  description = try(local.m352["description"], null)
  domain_group_moid = try(local.m352["domain_group_moid"], null)
  id = try(local.m352["id"], null)
  mod_time = try(local.m352["mod_time"], null)
  moid = try(local.m352["moid"], null)
  name = try(local.m352["name"], null)
  object_type = try(local.m352["object_type"], null)
  organization = try(local.m352["organization"], null)
  owners = try(local.m352["owners"], null)
  parent = try(local.m352["parent"], null)
  permission_resources = try(local.m352["permission_resources"], null)
  profiles = try(local.m352["profiles"], null)
  shared_scope = try(local.m352["shared_scope"], null)
  tags = try(local.m352["tags"], null)
  target_platform = try(local.m352["target_platform"], null)
  version_context = try(local.m352["version_context"], null)
}
