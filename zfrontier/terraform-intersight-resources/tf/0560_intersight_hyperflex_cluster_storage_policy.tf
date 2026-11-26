# Sample resource intersight_hyperflex_cluster_storage_policy — reads ../models/intersight_hyperflex_cluster_storage_policy.yml
locals { m560 = yamldecode(file("${path.module}/../models/intersight_hyperflex_cluster_storage_policy.yml"))["intersight_hyperflex_cluster_storage_policy"] }

resource "intersight_hyperflex_cluster_storage_policy" "n560" {
  account_moid = try(local.m560["account_moid"], null)
  additional_properties = try(local.m560["additional_properties"], null)
  ancestors = try(local.m560["ancestors"], null)
  class_id = try(local.m560["class_id"], null)
  cluster_profiles = try(local.m560["cluster_profiles"], null)
  create_time = try(local.m560["create_time"], null)
  description = try(local.m560["description"], null)
  disk_partition_cleanup = try(local.m560["disk_partition_cleanup"], null)
  domain_group_moid = try(local.m560["domain_group_moid"], null)
  id = try(local.m560["id"], null)
  logical_avalability_zone_config = try(local.m560["logical_avalability_zone_config"], null)
  mod_time = try(local.m560["mod_time"], null)
  moid = try(local.m560["moid"], null)
  name = try(local.m560["name"], null)
  object_type = try(local.m560["object_type"], null)
  organization = try(local.m560["organization"], null)
  owners = try(local.m560["owners"], null)
  parent = try(local.m560["parent"], null)
  permission_resources = try(local.m560["permission_resources"], null)
  shared_scope = try(local.m560["shared_scope"], null)
  tags = try(local.m560["tags"], null)
  vdi_optimization = try(local.m560["vdi_optimization"], null)
  version_context = try(local.m560["version_context"], null)
}
