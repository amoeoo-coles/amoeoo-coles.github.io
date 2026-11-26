# Sample resource intersight_certificatemanagement_policy — reads ../models/intersight_certificatemanagement_policy.yml
locals { m209 = yamldecode(file("${path.module}/../models/intersight_certificatemanagement_policy.yml"))["intersight_certificatemanagement_policy"] }

resource "intersight_certificatemanagement_policy" "n209" {
  account_moid = try(local.m209["account_moid"], null)
  additional_properties = try(local.m209["additional_properties"], null)
  ancestors = try(local.m209["ancestors"], null)
  certificates = try(local.m209["certificates"], null)
  class_id = try(local.m209["class_id"], null)
  create_time = try(local.m209["create_time"], null)
  description = try(local.m209["description"], null)
  domain_group_moid = try(local.m209["domain_group_moid"], null)
  id = try(local.m209["id"], null)
  mod_time = try(local.m209["mod_time"], null)
  moid = try(local.m209["moid"], null)
  name = try(local.m209["name"], null)
  object_type = try(local.m209["object_type"], null)
  organization = try(local.m209["organization"], null)
  owners = try(local.m209["owners"], null)
  parent = try(local.m209["parent"], null)
  permission_resources = try(local.m209["permission_resources"], null)
  profiles = try(local.m209["profiles"], null)
  shared_scope = try(local.m209["shared_scope"], null)
  tags = try(local.m209["tags"], null)
  version_context = try(local.m209["version_context"], null)
}
