# Sample resource intersight_resourcepool_qualification_policy — reads ../models/intersight_resourcepool_qualification_policy.yml
locals { m1120 = yamldecode(file("${path.module}/../models/intersight_resourcepool_qualification_policy.yml"))["intersight_resourcepool_qualification_policy"] }

resource "intersight_resourcepool_qualification_policy" "n1120" {
  account_moid = try(local.m1120["account_moid"], null)
  additional_properties = try(local.m1120["additional_properties"], null)
  ancestors = try(local.m1120["ancestors"], null)
  class_id = try(local.m1120["class_id"], null)
  create_time = try(local.m1120["create_time"], null)
  description = try(local.m1120["description"], null)
  domain_group_moid = try(local.m1120["domain_group_moid"], null)
  id = try(local.m1120["id"], null)
  mod_time = try(local.m1120["mod_time"], null)
  moid = try(local.m1120["moid"], null)
  name = try(local.m1120["name"], null)
  object_type = try(local.m1120["object_type"], null)
  organization = try(local.m1120["organization"], null)
  owners = try(local.m1120["owners"], null)
  parent = try(local.m1120["parent"], null)
  permission_resources = try(local.m1120["permission_resources"], null)
  qualifiers = try(local.m1120["qualifiers"], null)
  resource_pools = try(local.m1120["resource_pools"], null)
  shared_scope = try(local.m1120["shared_scope"], null)
  tags = try(local.m1120["tags"], null)
  version_context = try(local.m1120["version_context"], null)
}
