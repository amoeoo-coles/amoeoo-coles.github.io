# Sample resource intersight_thermal_policy — reads ../models/intersight_thermal_policy.yml
locals { m1388 = yamldecode(file("${path.module}/../models/intersight_thermal_policy.yml"))["intersight_thermal_policy"] }

resource "intersight_thermal_policy" "n1388" {
  account_moid = try(local.m1388["account_moid"], null)
  additional_properties = try(local.m1388["additional_properties"], null)
  ancestors = try(local.m1388["ancestors"], null)
  class_id = try(local.m1388["class_id"], null)
  create_time = try(local.m1388["create_time"], null)
  description = try(local.m1388["description"], null)
  domain_group_moid = try(local.m1388["domain_group_moid"], null)
  fan_control_mode = try(local.m1388["fan_control_mode"], null)
  id = try(local.m1388["id"], null)
  mod_time = try(local.m1388["mod_time"], null)
  moid = try(local.m1388["moid"], null)
  name = try(local.m1388["name"], null)
  object_type = try(local.m1388["object_type"], null)
  organization = try(local.m1388["organization"], null)
  owners = try(local.m1388["owners"], null)
  parent = try(local.m1388["parent"], null)
  permission_resources = try(local.m1388["permission_resources"], null)
  profiles = try(local.m1388["profiles"], null)
  shared_scope = try(local.m1388["shared_scope"], null)
  tags = try(local.m1388["tags"], null)
  version_context = try(local.m1388["version_context"], null)
}
