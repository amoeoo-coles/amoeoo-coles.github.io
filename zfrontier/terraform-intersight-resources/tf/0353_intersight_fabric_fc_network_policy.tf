# Sample resource intersight_fabric_fc_network_policy — reads ../models/intersight_fabric_fc_network_policy.yml
locals { m353 = yamldecode(file("${path.module}/../models/intersight_fabric_fc_network_policy.yml"))["intersight_fabric_fc_network_policy"] }

resource "intersight_fabric_fc_network_policy" "n353" {
  account_moid = try(local.m353["account_moid"], null)
  additional_properties = try(local.m353["additional_properties"], null)
  ancestors = try(local.m353["ancestors"], null)
  class_id = try(local.m353["class_id"], null)
  create_time = try(local.m353["create_time"], null)
  description = try(local.m353["description"], null)
  domain_group_moid = try(local.m353["domain_group_moid"], null)
  enable_trunking = try(local.m353["enable_trunking"], null)
  id = try(local.m353["id"], null)
  mod_time = try(local.m353["mod_time"], null)
  moid = try(local.m353["moid"], null)
  name = try(local.m353["name"], null)
  object_type = try(local.m353["object_type"], null)
  organization = try(local.m353["organization"], null)
  owners = try(local.m353["owners"], null)
  parent = try(local.m353["parent"], null)
  permission_resources = try(local.m353["permission_resources"], null)
  profiles = try(local.m353["profiles"], null)
  shared_scope = try(local.m353["shared_scope"], null)
  tags = try(local.m353["tags"], null)
  version_context = try(local.m353["version_context"], null)
}
