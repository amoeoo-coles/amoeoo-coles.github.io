# Sample resource intersight_fabric_multicast_policy — reads ../models/intersight_fabric_multicast_policy.yml
locals { m365 = yamldecode(file("${path.module}/../models/intersight_fabric_multicast_policy.yml"))["intersight_fabric_multicast_policy"] }

resource "intersight_fabric_multicast_policy" "n365" {
  account_moid = try(local.m365["account_moid"], null)
  additional_properties = try(local.m365["additional_properties"], null)
  ancestors = try(local.m365["ancestors"], null)
  class_id = try(local.m365["class_id"], null)
  create_time = try(local.m365["create_time"], null)
  description = try(local.m365["description"], null)
  domain_group_moid = try(local.m365["domain_group_moid"], null)
  id = try(local.m365["id"], null)
  mod_time = try(local.m365["mod_time"], null)
  moid = try(local.m365["moid"], null)
  name = try(local.m365["name"], null)
  object_type = try(local.m365["object_type"], null)
  organization = try(local.m365["organization"], null)
  owners = try(local.m365["owners"], null)
  parent = try(local.m365["parent"], null)
  permission_resources = try(local.m365["permission_resources"], null)
  querier_ip_address = try(local.m365["querier_ip_address"], null)
  querier_ip_address_peer = try(local.m365["querier_ip_address_peer"], null)
  querier_state = try(local.m365["querier_state"], null)
  shared_scope = try(local.m365["shared_scope"], null)
  snooping_state = try(local.m365["snooping_state"], null)
  src_ip_proxy = try(local.m365["src_ip_proxy"], null)
  tags = try(local.m365["tags"], null)
  version_context = try(local.m365["version_context"], null)
}
