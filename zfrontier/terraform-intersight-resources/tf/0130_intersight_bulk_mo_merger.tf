# Sample resource intersight_bulk_mo_merger — reads ../models/intersight_bulk_mo_merger.yml
locals { m130 = yamldecode(file("${path.module}/../models/intersight_bulk_mo_merger.yml"))["intersight_bulk_mo_merger"] }

resource "intersight_bulk_mo_merger" "n130" {
  account_moid = try(local.m130["account_moid"], null)
  additional_properties = try(local.m130["additional_properties"], null)
  ancestors = try(local.m130["ancestors"], null)
  async_result = try(local.m130["async_result"], null)
  class_id = try(local.m130["class_id"], null)
  create_time = try(local.m130["create_time"], null)
  domain_group_moid = try(local.m130["domain_group_moid"], null)
  id = try(local.m130["id"], null)
  merge_action = try(local.m130["merge_action"], null)
  mod_time = try(local.m130["mod_time"], null)
  moid = try(local.m130["moid"], null)
  object_type = try(local.m130["object_type"], null)
  organization = try(local.m130["organization"], null)
  owners = try(local.m130["owners"], null)
  parent = try(local.m130["parent"], null)
  permission_resources = try(local.m130["permission_resources"], null)
  responses = try(local.m130["responses"], null)
  shared_scope = try(local.m130["shared_scope"], null)
  sources = try(local.m130["sources"], null)
  tags = try(local.m130["tags"], null)
  target_config = try(local.m130["target_config"], null)
  targets = try(local.m130["targets"], null)
  version_context = try(local.m130["version_context"], null)
  workflow_name_suffix = try(local.m130["workflow_name_suffix"], null)
}
