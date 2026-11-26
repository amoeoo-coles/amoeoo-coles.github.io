# Sample resource intersight_techsupportmanagement_collection_control_policy — reads ../models/intersight_techsupportmanagement_collection_control_policy.yml
locals { m1380 = yamldecode(file("${path.module}/../models/intersight_techsupportmanagement_collection_control_policy.yml"))["intersight_techsupportmanagement_collection_control_policy"] }

resource "intersight_techsupportmanagement_collection_control_policy" "n1380" {
  account = try(local.m1380["account"], null)
  account_moid = try(local.m1380["account_moid"], null)
  additional_properties = try(local.m1380["additional_properties"], null)
  ancestors = try(local.m1380["ancestors"], null)
  class_id = try(local.m1380["class_id"], null)
  create_time = try(local.m1380["create_time"], null)
  deployment_type = try(local.m1380["deployment_type"], null)
  domain_group_moid = try(local.m1380["domain_group_moid"], null)
  id = try(local.m1380["id"], null)
  mod_time = try(local.m1380["mod_time"], null)
  moid = try(local.m1380["moid"], null)
  object_type = try(local.m1380["object_type"], null)
  owners = try(local.m1380["owners"], null)
  parent = try(local.m1380["parent"], null)
  permission_resources = try(local.m1380["permission_resources"], null)
  shared_scope = try(local.m1380["shared_scope"], null)
  tags = try(local.m1380["tags"], null)
  tech_support_collection = try(local.m1380["tech_support_collection"], null)
  version_context = try(local.m1380["version_context"], null)
}
