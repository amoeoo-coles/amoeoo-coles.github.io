# Sample resource intersight_fabric_net_flow_policy — reads ../models/intersight_fabric_net_flow_policy.yml
locals { m368 = yamldecode(file("${path.module}/../models/intersight_fabric_net_flow_policy.yml"))["intersight_fabric_net_flow_policy"] }

resource "intersight_fabric_net_flow_policy" "n368" {
  account_moid = try(local.m368["account_moid"], null)
  additional_properties = try(local.m368["additional_properties"], null)
  ancestors = try(local.m368["ancestors"], null)
  class_id = try(local.m368["class_id"], null)
  create_time = try(local.m368["create_time"], null)
  description = try(local.m368["description"], null)
  domain_group_moid = try(local.m368["domain_group_moid"], null)
  id = try(local.m368["id"], null)
  mod_time = try(local.m368["mod_time"], null)
  moid = try(local.m368["moid"], null)
  name = try(local.m368["name"], null)
  object_type = try(local.m368["object_type"], null)
  organization = try(local.m368["organization"], null)
  owners = try(local.m368["owners"], null)
  parent = try(local.m368["parent"], null)
  permission_resources = try(local.m368["permission_resources"], null)
  profiles = try(local.m368["profiles"], null)
  shared_scope = try(local.m368["shared_scope"], null)
  tags = try(local.m368["tags"], null)
  version_context = try(local.m368["version_context"], null)
}
