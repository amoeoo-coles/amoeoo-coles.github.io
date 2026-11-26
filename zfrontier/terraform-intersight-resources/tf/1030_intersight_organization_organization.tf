# Sample resource intersight_organization_organization — reads ../models/intersight_organization_organization.yml
locals { m1030 = yamldecode(file("${path.module}/../models/intersight_organization_organization.yml"))["intersight_organization_organization"] }

resource "intersight_organization_organization" "n1030" {
  account = try(local.m1030["account"], null)
  account_moid = try(local.m1030["account_moid"], null)
  additional_properties = try(local.m1030["additional_properties"], null)
  ancestors = try(local.m1030["ancestors"], null)
  class_id = try(local.m1030["class_id"], null)
  create_time = try(local.m1030["create_time"], null)
  description = try(local.m1030["description"], null)
  domain_group_moid = try(local.m1030["domain_group_moid"], null)
  id = try(local.m1030["id"], null)
  mod_time = try(local.m1030["mod_time"], null)
  moid = try(local.m1030["moid"], null)
  name = try(local.m1030["name"], null)
  object_type = try(local.m1030["object_type"], null)
  owners = try(local.m1030["owners"], null)
  parent = try(local.m1030["parent"], null)
  permission_resources = try(local.m1030["permission_resources"], null)
  resource_groups = try(local.m1030["resource_groups"], null)
  shared_scope = try(local.m1030["shared_scope"], null)
  shared_with_resources = try(local.m1030["shared_with_resources"], null)
  tags = try(local.m1030["tags"], null)
  version_context = try(local.m1030["version_context"], null)
}
