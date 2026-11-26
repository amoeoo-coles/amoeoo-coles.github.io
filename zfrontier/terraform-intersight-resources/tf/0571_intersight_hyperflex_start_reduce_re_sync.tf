# Sample resource intersight_hyperflex_start_reduce_re_sync — reads ../models/intersight_hyperflex_start_reduce_re_sync.yml
locals { m571 = yamldecode(file("${path.module}/../models/intersight_hyperflex_start_reduce_re_sync.yml"))["intersight_hyperflex_start_reduce_re_sync"] }

resource "intersight_hyperflex_start_reduce_re_sync" "n571" {
  account_moid = try(local.m571["account_moid"], null)
  additional_properties = try(local.m571["additional_properties"], null)
  ancestors = try(local.m571["ancestors"], null)
  class_id = try(local.m571["class_id"], null)
  cluster_mo_ids = try(local.m571["cluster_mo_ids"], null)
  create_time = try(local.m571["create_time"], null)
  domain_group_moid = try(local.m571["domain_group_moid"], null)
  id = try(local.m571["id"], null)
  mod_time = try(local.m571["mod_time"], null)
  moid = try(local.m571["moid"], null)
  object_type = try(local.m571["object_type"], null)
  operation = try(local.m571["operation"], null)
  owners = try(local.m571["owners"], null)
  parent = try(local.m571["parent"], null)
  permission_resources = try(local.m571["permission_resources"], null)
  shared_scope = try(local.m571["shared_scope"], null)
  tags = try(local.m571["tags"], null)
  target_details = try(local.m571["target_details"], null)
  version_context = try(local.m571["version_context"], null)
}
