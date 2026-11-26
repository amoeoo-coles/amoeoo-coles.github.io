# Sample resource intersight_aaa_retention_policy — reads ../models/intersight_aaa_retention_policy.yml
locals { m001 = yamldecode(file("${path.module}/../models/intersight_aaa_retention_policy.yml"))["intersight_aaa_retention_policy"] }

resource "intersight_aaa_retention_policy" "n001" {
  account = try(local.m001["account"], null)
  account_moid = try(local.m001["account_moid"], null)
  additional_properties = try(local.m001["additional_properties"], null)
  ancestors = try(local.m001["ancestors"], null)
  class_id = try(local.m001["class_id"], null)
  create_time = try(local.m001["create_time"], null)
  description = try(local.m001["description"], null)
  domain_group_moid = try(local.m001["domain_group_moid"], null)
  id = try(local.m001["id"], null)
  mod_time = try(local.m001["mod_time"], null)
  moid = try(local.m001["moid"], null)
  name = try(local.m001["name"], null)
  object_type = try(local.m001["object_type"], null)
  owners = try(local.m001["owners"], null)
  parent = try(local.m001["parent"], null)
  permission_resources = try(local.m001["permission_resources"], null)
  retention_period = try(local.m001["retention_period"], null)
  shared_scope = try(local.m001["shared_scope"], null)
  tags = try(local.m001["tags"], null)
  version_context = try(local.m001["version_context"], null)
}
