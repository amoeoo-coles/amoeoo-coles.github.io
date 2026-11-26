# Sample resource intersight_appliance_cluster_worker_node_replace — reads ../models/intersight_appliance_cluster_worker_node_replace.yml
locals { m023 = yamldecode(file("${path.module}/../models/intersight_appliance_cluster_worker_node_replace.yml"))["intersight_appliance_cluster_worker_node_replace"] }

resource "intersight_appliance_cluster_worker_node_replace" "n023" {
  account = try(local.m023["account"], null)
  account_moid = try(local.m023["account_moid"], null)
  additional_properties = try(local.m023["additional_properties"], null)
  ancestors = try(local.m023["ancestors"], null)
  class_id = try(local.m023["class_id"], null)
  create_time = try(local.m023["create_time"], null)
  domain_group_moid = try(local.m023["domain_group_moid"], null)
  hostname = try(local.m023["hostname"], null)
  id = try(local.m023["id"], null)
  mod_time = try(local.m023["mod_time"], null)
  moid = try(local.m023["moid"], null)
  object_type = try(local.m023["object_type"], null)
  owners = try(local.m023["owners"], null)
  parent = try(local.m023["parent"], null)
  permission_resources = try(local.m023["permission_resources"], null)
  shared_scope = try(local.m023["shared_scope"], null)
  tags = try(local.m023["tags"], null)
  version_context = try(local.m023["version_context"], null)
}
