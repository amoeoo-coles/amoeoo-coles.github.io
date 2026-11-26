# Sample resource intersight_bulk_mo_cloner — reads ../models/intersight_bulk_mo_cloner.yml
locals { m128 = yamldecode(file("${path.module}/../models/intersight_bulk_mo_cloner.yml"))["intersight_bulk_mo_cloner"] }

resource "intersight_bulk_mo_cloner" "n128" {
  account_moid = try(local.m128["account_moid"], null)
  additional_properties = try(local.m128["additional_properties"], null)
  ancestors = try(local.m128["ancestors"], null)
  async_result = try(local.m128["async_result"], null)
  class_id = try(local.m128["class_id"], null)
  create_time = try(local.m128["create_time"], null)
  domain_group_moid = try(local.m128["domain_group_moid"], null)
  exclude_properties = try(local.m128["exclude_properties"], null)
  id = try(local.m128["id"], null)
  mod_time = try(local.m128["mod_time"], null)
  moid = try(local.m128["moid"], null)
  object_type = try(local.m128["object_type"], null)
  organization = try(local.m128["organization"], null)
  owners = try(local.m128["owners"], null)
  parent = try(local.m128["parent"], null)
  permission_resources = try(local.m128["permission_resources"], null)
  responses = try(local.m128["responses"], null)
  shared_scope = try(local.m128["shared_scope"], null)
  sources = try(local.m128["sources"], null)
  tags = try(local.m128["tags"], null)
  targets = try(local.m128["targets"], null)
  version_context = try(local.m128["version_context"], null)
  workflow_name_suffix = try(local.m128["workflow_name_suffix"], null)
}
