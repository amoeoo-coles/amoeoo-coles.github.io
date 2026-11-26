# Sample resource intersight_iam_sharing_rule — reads ../models/intersight_iam_sharing_rule.yml
locals { m681 = yamldecode(file("${path.module}/../models/intersight_iam_sharing_rule.yml"))["intersight_iam_sharing_rule"] }

resource "intersight_iam_sharing_rule" "n681" {
  account = try(local.m681["account"], null)
  account_moid = try(local.m681["account_moid"], null)
  additional_properties = try(local.m681["additional_properties"], null)
  ancestors = try(local.m681["ancestors"], null)
  class_id = try(local.m681["class_id"], null)
  create_time = try(local.m681["create_time"], null)
  domain_group_moid = try(local.m681["domain_group_moid"], null)
  id = try(local.m681["id"], null)
  mod_time = try(local.m681["mod_time"], null)
  moid = try(local.m681["moid"], null)
  object_type = try(local.m681["object_type"], null)
  owners = try(local.m681["owners"], null)
  parent = try(local.m681["parent"], null)
  permission_resources = try(local.m681["permission_resources"], null)
  shared_resource = try(local.m681["shared_resource"], null)
  shared_scope = try(local.m681["shared_scope"], null)
  shared_with_resource = try(local.m681["shared_with_resource"], null)
  tags = try(local.m681["tags"], null)
  version_context = try(local.m681["version_context"], null)
}
