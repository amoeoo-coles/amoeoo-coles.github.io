# Sample resource intersight_vnic_fc_network_policy — reads ../models/intersight_vnic_fc_network_policy.yml
locals { m1443 = yamldecode(file("${path.module}/../models/intersight_vnic_fc_network_policy.yml"))["intersight_vnic_fc_network_policy"] }

resource "intersight_vnic_fc_network_policy" "n1443" {
  account_moid = try(local.m1443["account_moid"], null)
  additional_properties = try(local.m1443["additional_properties"], null)
  ancestors = try(local.m1443["ancestors"], null)
  class_id = try(local.m1443["class_id"], null)
  create_time = try(local.m1443["create_time"], null)
  description = try(local.m1443["description"], null)
  domain_group_moid = try(local.m1443["domain_group_moid"], null)
  id = try(local.m1443["id"], null)
  mod_time = try(local.m1443["mod_time"], null)
  moid = try(local.m1443["moid"], null)
  name = try(local.m1443["name"], null)
  object_type = try(local.m1443["object_type"], null)
  organization = try(local.m1443["organization"], null)
  owners = try(local.m1443["owners"], null)
  parent = try(local.m1443["parent"], null)
  permission_resources = try(local.m1443["permission_resources"], null)
  shared_scope = try(local.m1443["shared_scope"], null)
  tags = try(local.m1443["tags"], null)
  version_context = try(local.m1443["version_context"], null)
  vsan_settings = try(local.m1443["vsan_settings"], null)
}
