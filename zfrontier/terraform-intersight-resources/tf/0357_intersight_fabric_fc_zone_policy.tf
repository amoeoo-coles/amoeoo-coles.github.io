# Sample resource intersight_fabric_fc_zone_policy — reads ../models/intersight_fabric_fc_zone_policy.yml
locals { m357 = yamldecode(file("${path.module}/../models/intersight_fabric_fc_zone_policy.yml"))["intersight_fabric_fc_zone_policy"] }

resource "intersight_fabric_fc_zone_policy" "n357" {
  account_moid = try(local.m357["account_moid"], null)
  additional_properties = try(local.m357["additional_properties"], null)
  ancestors = try(local.m357["ancestors"], null)
  class_id = try(local.m357["class_id"], null)
  create_time = try(local.m357["create_time"], null)
  description = try(local.m357["description"], null)
  domain_group_moid = try(local.m357["domain_group_moid"], null)
  fc_target_members = try(local.m357["fc_target_members"], null)
  fc_target_zoning_type = try(local.m357["fc_target_zoning_type"], null)
  id = try(local.m357["id"], null)
  mod_time = try(local.m357["mod_time"], null)
  moid = try(local.m357["moid"], null)
  name = try(local.m357["name"], null)
  object_type = try(local.m357["object_type"], null)
  organization = try(local.m357["organization"], null)
  owners = try(local.m357["owners"], null)
  parent = try(local.m357["parent"], null)
  permission_resources = try(local.m357["permission_resources"], null)
  shared_scope = try(local.m357["shared_scope"], null)
  tags = try(local.m357["tags"], null)
  version_context = try(local.m357["version_context"], null)
}
