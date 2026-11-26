# Sample resource intersight_iam_trust_point — reads ../models/intersight_iam_trust_point.yml
locals { m682 = yamldecode(file("${path.module}/../models/intersight_iam_trust_point.yml"))["intersight_iam_trust_point"] }

resource "intersight_iam_trust_point" "n682" {
  account = try(local.m682["account"], null)
  account_moid = try(local.m682["account_moid"], null)
  additional_properties = try(local.m682["additional_properties"], null)
  ancestors = try(local.m682["ancestors"], null)
  assigned_to_entity = try(local.m682["assigned_to_entity"], null)
  certificates = try(local.m682["certificates"], null)
  chain = try(local.m682["chain"], null)
  class_id = try(local.m682["class_id"], null)
  create_time = try(local.m682["create_time"], null)
  domain_group_moid = try(local.m682["domain_group_moid"], null)
  id = try(local.m682["id"], null)
  mod_time = try(local.m682["mod_time"], null)
  moid = try(local.m682["moid"], null)
  object_type = try(local.m682["object_type"], null)
  owners = try(local.m682["owners"], null)
  parent = try(local.m682["parent"], null)
  permission_resources = try(local.m682["permission_resources"], null)
  shared_scope = try(local.m682["shared_scope"], null)
  tags = try(local.m682["tags"], null)
  version_context = try(local.m682["version_context"], null)
}
