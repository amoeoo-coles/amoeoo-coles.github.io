# Sample resource intersight_pool_id_mapping_policy — reads ../models/intersight_pool_id_mapping_policy.yml
locals { m1070 = yamldecode(file("${path.module}/../models/intersight_pool_id_mapping_policy.yml"))["intersight_pool_id_mapping_policy"] }

resource "intersight_pool_id_mapping_policy" "n1070" {
  account_moid = try(local.m1070["account_moid"], null)
  additional_properties = try(local.m1070["additional_properties"], null)
  ancestors = try(local.m1070["ancestors"], null)
  class_id = try(local.m1070["class_id"], null)
  create_time = try(local.m1070["create_time"], null)
  description = try(local.m1070["description"], null)
  domain_group_moid = try(local.m1070["domain_group_moid"], null)
  exported_selectors = try(local.m1070["exported_selectors"], null)
  id = try(local.m1070["id"], null)
  mod_time = try(local.m1070["mod_time"], null)
  moid = try(local.m1070["moid"], null)
  name = try(local.m1070["name"], null)
  object_type = try(local.m1070["object_type"], null)
  organization = try(local.m1070["organization"], null)
  owners = try(local.m1070["owners"], null)
  parent = try(local.m1070["parent"], null)
  per_type_combined_selector = try(local.m1070["per_type_combined_selector"], null)
  permission_resources = try(local.m1070["permission_resources"], null)
  selectors = try(local.m1070["selectors"], null)
  shared_scope = try(local.m1070["shared_scope"], null)
  tags = try(local.m1070["tags"], null)
  usage_count = try(local.m1070["usage_count"], null)
  version_context = try(local.m1070["version_context"], null)
}
