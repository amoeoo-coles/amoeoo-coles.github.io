# Sample resource intersight_hyperflex_reduce_re_sync — reads ../models/intersight_hyperflex_reduce_re_sync.yml
locals { m568 = yamldecode(file("${path.module}/../models/intersight_hyperflex_reduce_re_sync.yml"))["intersight_hyperflex_reduce_re_sync"] }

resource "intersight_hyperflex_reduce_re_sync" "n568" {
  account_moid = try(local.m568["account_moid"], null)
  additional_properties = try(local.m568["additional_properties"], null)
  ancestors = try(local.m568["ancestors"], null)
  class_id = try(local.m568["class_id"], null)
  cluster = try(local.m568["cluster"], null)
  completion_status = try(local.m568["completion_status"], null)
  create_time = try(local.m568["create_time"], null)
  domain_group_moid = try(local.m568["domain_group_moid"], null)
  execution_output = try(local.m568["execution_output"], null)
  id = try(local.m568["id"], null)
  mod_time = try(local.m568["mod_time"], null)
  moid = try(local.m568["moid"], null)
  object_type = try(local.m568["object_type"], null)
  owners = try(local.m568["owners"], null)
  parent = try(local.m568["parent"], null)
  permission_resources = try(local.m568["permission_resources"], null)
  shared_scope = try(local.m568["shared_scope"], null)
  tags = try(local.m568["tags"], null)
  version_context = try(local.m568["version_context"], null)
}
