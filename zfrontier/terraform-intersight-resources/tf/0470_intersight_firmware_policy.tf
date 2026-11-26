# Sample resource intersight_firmware_policy — reads ../models/intersight_firmware_policy.yml
locals { m470 = yamldecode(file("${path.module}/../models/intersight_firmware_policy.yml"))["intersight_firmware_policy"] }

resource "intersight_firmware_policy" "n470" {
  account_moid = try(local.m470["account_moid"], null)
  additional_properties = try(local.m470["additional_properties"], null)
  ancestors = try(local.m470["ancestors"], null)
  class_id = try(local.m470["class_id"], null)
  create_time = try(local.m470["create_time"], null)
  description = try(local.m470["description"], null)
  domain_group_moid = try(local.m470["domain_group_moid"], null)
  exclude_component_list = try(local.m470["exclude_component_list"], null)
  id = try(local.m470["id"], null)
  mod_time = try(local.m470["mod_time"], null)
  model_bundle_combo = try(local.m470["model_bundle_combo"], null)
  moid = try(local.m470["moid"], null)
  name = try(local.m470["name"], null)
  object_type = try(local.m470["object_type"], null)
  organization = try(local.m470["organization"], null)
  owners = try(local.m470["owners"], null)
  parent = try(local.m470["parent"], null)
  permission_resources = try(local.m470["permission_resources"], null)
  profiles = try(local.m470["profiles"], null)
  shared_scope = try(local.m470["shared_scope"], null)
  tags = try(local.m470["tags"], null)
  target_platform = try(local.m470["target_platform"], null)
  version_context = try(local.m470["version_context"], null)
}
