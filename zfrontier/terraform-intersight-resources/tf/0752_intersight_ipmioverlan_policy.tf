# Sample resource intersight_ipmioverlan_policy — reads ../models/intersight_ipmioverlan_policy.yml
locals { m752 = yamldecode(file("${path.module}/../models/intersight_ipmioverlan_policy.yml"))["intersight_ipmioverlan_policy"] }

resource "intersight_ipmioverlan_policy" "n752" {
  account_moid = try(local.m752["account_moid"], null)
  additional_properties = try(local.m752["additional_properties"], null)
  ancestors = try(local.m752["ancestors"], null)
  class_id = try(local.m752["class_id"], null)
  create_time = try(local.m752["create_time"], null)
  description = try(local.m752["description"], null)
  domain_group_moid = try(local.m752["domain_group_moid"], null)
  enabled = try(local.m752["enabled"], null)
  encryption_key = try(var.secrets["intersight_ipmioverlan_policy.encryption_key"], local.m752["encryption_key"])
  id = try(local.m752["id"], null)
  is_encryption_key_set = try(var.secrets["intersight_ipmioverlan_policy.is_encryption_key_set"], local.m752["is_encryption_key_set"])
  mod_time = try(local.m752["mod_time"], null)
  moid = try(local.m752["moid"], null)
  name = try(local.m752["name"], null)
  object_type = try(local.m752["object_type"], null)
  organization = try(local.m752["organization"], null)
  owners = try(local.m752["owners"], null)
  parent = try(local.m752["parent"], null)
  permission_resources = try(local.m752["permission_resources"], null)
  privilege = try(local.m752["privilege"], null)
  profiles = try(local.m752["profiles"], null)
  shared_scope = try(local.m752["shared_scope"], null)
  tags = try(local.m752["tags"], null)
  version_context = try(local.m752["version_context"], null)
}
