# Sample resource intersight_memory_policy — reads ../models/intersight_memory_policy.yml
locals { m822 = yamldecode(file("${path.module}/../models/intersight_memory_policy.yml"))["intersight_memory_policy"] }

resource "intersight_memory_policy" "n822" {
  account_moid = try(local.m822["account_moid"], null)
  additional_properties = try(local.m822["additional_properties"], null)
  ancestors = try(local.m822["ancestors"], null)
  class_id = try(local.m822["class_id"], null)
  create_time = try(local.m822["create_time"], null)
  description = try(local.m822["description"], null)
  domain_group_moid = try(local.m822["domain_group_moid"], null)
  enable_dimm_blocklisting = try(local.m822["enable_dimm_blocklisting"], null)
  id = try(local.m822["id"], null)
  mod_time = try(local.m822["mod_time"], null)
  moid = try(local.m822["moid"], null)
  name = try(local.m822["name"], null)
  object_type = try(local.m822["object_type"], null)
  organization = try(local.m822["organization"], null)
  owners = try(local.m822["owners"], null)
  parent = try(local.m822["parent"], null)
  permission_resources = try(local.m822["permission_resources"], null)
  profiles = try(local.m822["profiles"], null)
  shared_scope = try(local.m822["shared_scope"], null)
  tags = try(local.m822["tags"], null)
  version_context = try(local.m822["version_context"], null)
}
