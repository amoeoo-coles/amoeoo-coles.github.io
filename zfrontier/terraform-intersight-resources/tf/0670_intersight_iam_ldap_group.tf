# Sample resource intersight_iam_ldap_group — reads ../models/intersight_iam_ldap_group.yml
locals { m670 = yamldecode(file("${path.module}/../models/intersight_iam_ldap_group.yml"))["intersight_iam_ldap_group"] }

resource "intersight_iam_ldap_group" "n670" {
  account_moid = try(local.m670["account_moid"], null)
  additional_properties = try(local.m670["additional_properties"], null)
  ancestors = try(local.m670["ancestors"], null)
  class_id = try(local.m670["class_id"], null)
  create_time = try(local.m670["create_time"], null)
  domain = try(local.m670["domain"], null)
  domain_group_moid = try(local.m670["domain_group_moid"], null)
  end_point_role = try(local.m670["end_point_role"], null)
  group_dn = try(local.m670["group_dn"], null)
  id = try(local.m670["id"], null)
  ldap_policy = try(local.m670["ldap_policy"], null)
  mod_time = try(local.m670["mod_time"], null)
  moid = try(local.m670["moid"], null)
  name = try(local.m670["name"], null)
  object_type = try(local.m670["object_type"], null)
  owners = try(local.m670["owners"], null)
  parent = try(local.m670["parent"], null)
  permission_resources = try(local.m670["permission_resources"], null)
  shared_scope = try(local.m670["shared_scope"], null)
  tags = try(local.m670["tags"], null)
  version_context = try(local.m670["version_context"], null)
}
