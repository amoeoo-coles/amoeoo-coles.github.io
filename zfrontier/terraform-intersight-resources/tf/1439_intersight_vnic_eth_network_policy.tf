# Sample resource intersight_vnic_eth_network_policy — reads ../models/intersight_vnic_eth_network_policy.yml
locals { m1439 = yamldecode(file("${path.module}/../models/intersight_vnic_eth_network_policy.yml"))["intersight_vnic_eth_network_policy"] }

resource "intersight_vnic_eth_network_policy" "n1439" {
  account_moid = try(local.m1439["account_moid"], null)
  additional_properties = try(local.m1439["additional_properties"], null)
  ancestors = try(local.m1439["ancestors"], null)
  class_id = try(local.m1439["class_id"], null)
  create_time = try(local.m1439["create_time"], null)
  description = try(local.m1439["description"], null)
  domain_group_moid = try(local.m1439["domain_group_moid"], null)
  id = try(local.m1439["id"], null)
  mod_time = try(local.m1439["mod_time"], null)
  moid = try(local.m1439["moid"], null)
  name = try(local.m1439["name"], null)
  object_type = try(local.m1439["object_type"], null)
  organization = try(local.m1439["organization"], null)
  owners = try(local.m1439["owners"], null)
  parent = try(local.m1439["parent"], null)
  permission_resources = try(local.m1439["permission_resources"], null)
  shared_scope = try(local.m1439["shared_scope"], null)
  tags = try(local.m1439["tags"], null)
  target_platform = try(local.m1439["target_platform"], null)
  version_context = try(local.m1439["version_context"], null)
  vlan_settings = try(local.m1439["vlan_settings"], null)
}
