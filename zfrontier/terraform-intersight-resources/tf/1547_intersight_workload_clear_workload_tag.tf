# Sample resource intersight_workload_clear_workload_tag — reads ../models/intersight_workload_clear_workload_tag.yml
locals { m1547 = yamldecode(file("${path.module}/../models/intersight_workload_clear_workload_tag.yml"))["intersight_workload_clear_workload_tag"] }

resource "intersight_workload_clear_workload_tag" "n1547" {
  account_moid = try(local.m1547["account_moid"], null)
  additional_properties = try(local.m1547["additional_properties"], null)
  ancestors = try(local.m1547["ancestors"], null)
  class_id = try(local.m1547["class_id"], null)
  create_time = try(local.m1547["create_time"], null)
  domain_group_moid = try(local.m1547["domain_group_moid"], null)
  id = try(local.m1547["id"], null)
  mod_time = try(local.m1547["mod_time"], null)
  moid = try(local.m1547["moid"], null)
  object_type = try(local.m1547["object_type"], null)
  objects = try(local.m1547["objects"], null)
  owners = try(local.m1547["owners"], null)
  parent = try(local.m1547["parent"], null)
  permission_resources = try(local.m1547["permission_resources"], null)
  shared_scope = try(local.m1547["shared_scope"], null)
  tags = try(local.m1547["tags"], null)
  version_context = try(local.m1547["version_context"], null)
}
