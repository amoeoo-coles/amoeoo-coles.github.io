# Sample resource intersight_iam_resource_roles — reads ../models/intersight_iam_resource_roles.yml
locals { m679 = yamldecode(file("${path.module}/../models/intersight_iam_resource_roles.yml"))["intersight_iam_resource_roles"] }

resource "intersight_iam_resource_roles" "n679" {
  account_moid = try(local.m679["account_moid"], null)
  additional_properties = try(local.m679["additional_properties"], null)
  ancestors = try(local.m679["ancestors"], null)
  class_id = try(local.m679["class_id"], null)
  create_time = try(local.m679["create_time"], null)
  domain_group_moid = try(local.m679["domain_group_moid"], null)
  end_point_roles = try(local.m679["end_point_roles"], null)
  id = try(local.m679["id"], null)
  mod_time = try(local.m679["mod_time"], null)
  moid = try(local.m679["moid"], null)
  object_type = try(local.m679["object_type"], null)
  owners = try(local.m679["owners"], null)
  parent = try(local.m679["parent"], null)
  permission = try(local.m679["permission"], null)
  permission_resources = try(local.m679["permission_resources"], null)
  privilege_sets = try(local.m679["privilege_sets"], null)
  resource = try(local.m679["resource"], null)
  roles = try(local.m679["roles"], null)
  shared_scope = try(local.m679["shared_scope"], null)
  tags = try(local.m679["tags"], null)
  version_context = try(local.m679["version_context"], null)
}
