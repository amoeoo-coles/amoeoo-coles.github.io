# Sample resource intersight_hyperflex_cluster_replication_network_policy — reads ../models/intersight_hyperflex_cluster_replication_network_policy.yml
locals { m558 = yamldecode(file("${path.module}/../models/intersight_hyperflex_cluster_replication_network_policy.yml"))["intersight_hyperflex_cluster_replication_network_policy"] }

resource "intersight_hyperflex_cluster_replication_network_policy" "n558" {
  account_moid = try(local.m558["account_moid"], null)
  additional_properties = try(local.m558["additional_properties"], null)
  ancestors = try(local.m558["ancestors"], null)
  class_id = try(local.m558["class_id"], null)
  cluster_profiles = try(local.m558["cluster_profiles"], null)
  create_time = try(local.m558["create_time"], null)
  description = try(local.m558["description"], null)
  domain_group_moid = try(local.m558["domain_group_moid"], null)
  id = try(local.m558["id"], null)
  mod_time = try(local.m558["mod_time"], null)
  moid = try(local.m558["moid"], null)
  name = try(local.m558["name"], null)
  object_type = try(local.m558["object_type"], null)
  organization = try(local.m558["organization"], null)
  owners = try(local.m558["owners"], null)
  parent = try(local.m558["parent"], null)
  permission_resources = try(local.m558["permission_resources"], null)
  replication_bandwidth_mbps = try(local.m558["replication_bandwidth_mbps"], null)
  replication_ipranges = try(local.m558["replication_ipranges"], null)
  replication_mtu = try(local.m558["replication_mtu"], null)
  replication_vlan = try(local.m558["replication_vlan"], null)
  shared_scope = try(local.m558["shared_scope"], null)
  tags = try(local.m558["tags"], null)
  version_context = try(local.m558["version_context"], null)
}
