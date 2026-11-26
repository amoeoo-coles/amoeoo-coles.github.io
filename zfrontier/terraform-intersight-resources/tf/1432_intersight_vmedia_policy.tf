# Sample resource intersight_vmedia_policy — reads ../models/intersight_vmedia_policy.yml
locals { m1432 = yamldecode(file("${path.module}/../models/intersight_vmedia_policy.yml"))["intersight_vmedia_policy"] }

resource "intersight_vmedia_policy" "n1432" {
  account_moid = try(local.m1432["account_moid"], null)
  additional_properties = try(local.m1432["additional_properties"], null)
  ancestors = try(local.m1432["ancestors"], null)
  class_id = try(local.m1432["class_id"], null)
  create_time = try(local.m1432["create_time"], null)
  description = try(local.m1432["description"], null)
  domain_group_moid = try(local.m1432["domain_group_moid"], null)
  enabled = try(local.m1432["enabled"], null)
  encryption = try(local.m1432["encryption"], null)
  id = try(local.m1432["id"], null)
  low_power_usb = try(local.m1432["low_power_usb"], null)
  mappings = try(local.m1432["mappings"], null)
  mod_time = try(local.m1432["mod_time"], null)
  moid = try(local.m1432["moid"], null)
  name = try(local.m1432["name"], null)
  object_type = try(local.m1432["object_type"], null)
  organization = try(local.m1432["organization"], null)
  owners = try(local.m1432["owners"], null)
  parent = try(local.m1432["parent"], null)
  permission_resources = try(local.m1432["permission_resources"], null)
  profiles = try(local.m1432["profiles"], null)
  shared_scope = try(local.m1432["shared_scope"], null)
  tags = try(local.m1432["tags"], null)
  version_context = try(local.m1432["version_context"], null)
}
