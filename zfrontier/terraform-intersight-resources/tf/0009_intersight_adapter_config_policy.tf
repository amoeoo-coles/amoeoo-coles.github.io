# Sample resource intersight_adapter_config_policy — reads ../models/intersight_adapter_config_policy.yml
locals { m009 = yamldecode(file("${path.module}/../models/intersight_adapter_config_policy.yml"))["intersight_adapter_config_policy"] }

resource "intersight_adapter_config_policy" "n009" {
  account_moid = try(local.m009["account_moid"], null)
  additional_properties = try(local.m009["additional_properties"], null)
  ancestors = try(local.m009["ancestors"], null)
  class_id = try(local.m009["class_id"], null)
  create_time = try(local.m009["create_time"], null)
  description = try(local.m009["description"], null)
  domain_group_moid = try(local.m009["domain_group_moid"], null)
  id = try(local.m009["id"], null)
  mod_time = try(local.m009["mod_time"], null)
  moid = try(local.m009["moid"], null)
  name = try(local.m009["name"], null)
  object_type = try(local.m009["object_type"], null)
  organization = try(local.m009["organization"], null)
  owners = try(local.m009["owners"], null)
  parent = try(local.m009["parent"], null)
  permission_resources = try(local.m009["permission_resources"], null)
  profiles = try(local.m009["profiles"], null)
  settings = try(local.m009["settings"], null)
  shared_scope = try(local.m009["shared_scope"], null)
  tags = try(local.m009["tags"], null)
  version_context = try(local.m009["version_context"], null)
}
