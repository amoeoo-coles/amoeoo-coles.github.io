# Sample resource intersight_appliance_cluster_worker_node_reuse — reads ../models/intersight_appliance_cluster_worker_node_reuse.yml
locals { m024 = yamldecode(file("${path.module}/../models/intersight_appliance_cluster_worker_node_reuse.yml"))["intersight_appliance_cluster_worker_node_reuse"] }

resource "intersight_appliance_cluster_worker_node_reuse" "n024" {
  account = try(local.m024["account"], null)
  account_moid = try(local.m024["account_moid"], null)
  additional_properties = try(local.m024["additional_properties"], null)
  ancestors = try(local.m024["ancestors"], null)
  class_id = try(local.m024["class_id"], null)
  create_time = try(local.m024["create_time"], null)
  domain_group_moid = try(local.m024["domain_group_moid"], null)
  hostname = try(local.m024["hostname"], null)
  id = try(local.m024["id"], null)
  mod_time = try(local.m024["mod_time"], null)
  moid = try(local.m024["moid"], null)
  object_type = try(local.m024["object_type"], null)
  owners = try(local.m024["owners"], null)
  parent = try(local.m024["parent"], null)
  permission_resources = try(local.m024["permission_resources"], null)
  shared_scope = try(local.m024["shared_scope"], null)
  tags = try(local.m024["tags"], null)
  version_context = try(local.m024["version_context"], null)
}
