# Sample resource intersight_fabric_eth_network_group_policy — reads ../models/intersight_fabric_eth_network_group_policy.yml
locals { m351 = yamldecode(file("${path.module}/../models/intersight_fabric_eth_network_group_policy.yml"))["intersight_fabric_eth_network_group_policy"] }

resource "intersight_fabric_eth_network_group_policy" "n351" {
  account_moid = try(local.m351["account_moid"], null)
  additional_properties = try(local.m351["additional_properties"], null)
  ancestors = try(local.m351["ancestors"], null)
  class_id = try(local.m351["class_id"], null)
  create_time = try(local.m351["create_time"], null)
  description = try(local.m351["description"], null)
  domain_group_moid = try(local.m351["domain_group_moid"], null)
  id = try(local.m351["id"], null)
  mod_time = try(local.m351["mod_time"], null)
  moid = try(local.m351["moid"], null)
  name = try(local.m351["name"], null)
  object_type = try(local.m351["object_type"], null)
  organization = try(local.m351["organization"], null)
  owners = try(local.m351["owners"], null)
  parent = try(local.m351["parent"], null)
  permission_resources = try(local.m351["permission_resources"], null)
  shared_scope = try(local.m351["shared_scope"], null)
  tags = try(local.m351["tags"], null)
  version_context = try(local.m351["version_context"], null)
  vlan_settings = try(local.m351["vlan_settings"], null)
}
