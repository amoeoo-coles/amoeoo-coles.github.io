# Sample resource intersight_iam_ldap_provider — reads ../models/intersight_iam_ldap_provider.yml
locals { m672 = yamldecode(file("${path.module}/../models/intersight_iam_ldap_provider.yml"))["intersight_iam_ldap_provider"] }

resource "intersight_iam_ldap_provider" "n672" {
  account_moid = try(local.m672["account_moid"], null)
  additional_properties = try(local.m672["additional_properties"], null)
  ancestors = try(local.m672["ancestors"], null)
  class_id = try(local.m672["class_id"], null)
  create_time = try(local.m672["create_time"], null)
  domain_group_moid = try(local.m672["domain_group_moid"], null)
  id = try(local.m672["id"], null)
  ldap_policy = try(local.m672["ldap_policy"], null)
  mod_time = try(local.m672["mod_time"], null)
  moid = try(local.m672["moid"], null)
  object_type = try(local.m672["object_type"], null)
  owners = try(local.m672["owners"], null)
  parent = try(local.m672["parent"], null)
  permission_resources = try(local.m672["permission_resources"], null)
  port = try(local.m672["port"], null)
  server = try(local.m672["server"], null)
  shared_scope = try(local.m672["shared_scope"], null)
  tags = try(local.m672["tags"], null)
  vendor = try(local.m672["vendor"], null)
  version_context = try(local.m672["version_context"], null)
}
