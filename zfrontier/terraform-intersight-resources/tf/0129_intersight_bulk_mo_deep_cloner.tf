# Sample resource intersight_bulk_mo_deep_cloner — reads ../models/intersight_bulk_mo_deep_cloner.yml
locals { m129 = yamldecode(file("${path.module}/../models/intersight_bulk_mo_deep_cloner.yml"))["intersight_bulk_mo_deep_cloner"] }

resource "intersight_bulk_mo_deep_cloner" "n129" {
  account_moid = try(local.m129["account_moid"], null)
  additional_properties = try(local.m129["additional_properties"], null)
  ancestors = try(local.m129["ancestors"], null)
  async_result = try(local.m129["async_result"], null)
  class_id = try(local.m129["class_id"], null)
  create_time = try(local.m129["create_time"], null)
  domain_group_moid = try(local.m129["domain_group_moid"], null)
  exclude_properties = try(local.m129["exclude_properties"], null)
  id = try(local.m129["id"], null)
  mod_time = try(local.m129["mod_time"], null)
  moid = try(local.m129["moid"], null)
  nr_source = try(local.m129["nr_source"], null)
  object_type = try(local.m129["object_type"], null)
  organization = try(local.m129["organization"], null)
  owners = try(local.m129["owners"], null)
  parent = try(local.m129["parent"], null)
  permission_resources = try(local.m129["permission_resources"], null)
  reference_name_suffix = try(local.m129["reference_name_suffix"], null)
  reference_policy = try(local.m129["reference_policy"], null)
  shared_scope = try(local.m129["shared_scope"], null)
  tags = try(local.m129["tags"], null)
  targets = try(local.m129["targets"], null)
  version_context = try(local.m129["version_context"], null)
  workflow_name_suffix = try(local.m129["workflow_name_suffix"], null)
}
