# Sample resource intersight_iam_private_key_spec — reads ../models/intersight_iam_private_key_spec.yml
locals { m675 = yamldecode(file("${path.module}/../models/intersight_iam_private_key_spec.yml"))["intersight_iam_private_key_spec"] }

resource "intersight_iam_private_key_spec" "n675" {
  account_moid = try(local.m675["account_moid"], null)
  additional_properties = try(local.m675["additional_properties"], null)
  algorithm = try(local.m675["algorithm"], null)
  ancestors = try(local.m675["ancestors"], null)
  certificate_request = try(local.m675["certificate_request"], null)
  class_id = try(local.m675["class_id"], null)
  create_time = try(local.m675["create_time"], null)
  domain_group_moid = try(local.m675["domain_group_moid"], null)
  id = try(local.m675["id"], null)
  mod_time = try(local.m675["mod_time"], null)
  moid = try(local.m675["moid"], null)
  object_type = try(local.m675["object_type"], null)
  owners = try(local.m675["owners"], null)
  parent = try(local.m675["parent"], null)
  permission_resources = try(local.m675["permission_resources"], null)
  shared_scope = try(local.m675["shared_scope"], null)
  tags = try(local.m675["tags"], null)
  version_context = try(local.m675["version_context"], null)
}
