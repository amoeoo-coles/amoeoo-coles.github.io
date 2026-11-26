# Sample resource intersight_resource_selection_criteria — reads ../models/intersight_resource_selection_criteria.yml
locals { m1110 = yamldecode(file("${path.module}/../models/intersight_resource_selection_criteria.yml"))["intersight_resource_selection_criteria"] }

resource "intersight_resource_selection_criteria" "n1110" {
  account_moid = try(local.m1110["account_moid"], null)
  additional_properties = try(local.m1110["additional_properties"], null)
  ancestors = try(local.m1110["ancestors"], null)
  class_id = try(local.m1110["class_id"], null)
  create_time = try(local.m1110["create_time"], null)
  description = try(local.m1110["description"], null)
  domain_group_moid = try(local.m1110["domain_group_moid"], null)
  id = try(local.m1110["id"], null)
  mod_time = try(local.m1110["mod_time"], null)
  moid = try(local.m1110["moid"], null)
  name = try(local.m1110["name"], null)
  object_type = try(local.m1110["object_type"], null)
  organization = try(local.m1110["organization"], null)
  owners = try(local.m1110["owners"], null)
  parent = try(local.m1110["parent"], null)
  permission_resources = try(local.m1110["permission_resources"], null)
  place_holders = try(local.m1110["place_holders"], null)
  selectors = try(local.m1110["selectors"], null)
  shared_scope = try(local.m1110["shared_scope"], null)
  tags = try(local.m1110["tags"], null)
  version_context = try(local.m1110["version_context"], null)
}
