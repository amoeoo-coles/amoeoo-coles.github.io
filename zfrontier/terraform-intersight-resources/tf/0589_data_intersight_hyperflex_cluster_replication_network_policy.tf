# Sample data source intersight_hyperflex_cluster_replication_network_policy — reads ../models/data_intersight_hyperflex_cluster_replication_network_policy.yml
locals { m589 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_replication_network_policy.yml"))["data_intersight_hyperflex_cluster_replication_network_policy"] }

data "intersight_hyperflex_cluster_replication_network_policy" "n589" {
  account_moid = try(local.m589["account_moid"], null)
  additional_properties = try(local.m589["additional_properties"], null)
  class_id = try(local.m589["class_id"], null)
  create_time = try(local.m589["create_time"], null)
  description = try(local.m589["description"], null)
  domain_group_moid = try(local.m589["domain_group_moid"], null)
  id = try(local.m589["id"], null)
  mod_time = try(local.m589["mod_time"], null)
  moid = try(local.m589["moid"], null)
  name = try(local.m589["name"], null)
  object_type = try(local.m589["object_type"], null)
  owners = try(local.m589["owners"], null)
  replication_bandwidth_mbps = try(local.m589["replication_bandwidth_mbps"], null)
  replication_mtu = try(local.m589["replication_mtu"], null)
  results = try(local.m589["results"], null)
  shared_scope = try(local.m589["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m589["ancestors"], null) == null ? [] : local.m589["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m589["cluster_profiles"], null) == null ? [] : local.m589["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m589["organization"], null) == null ? [] : local.m589["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m589["parent"], null) == null ? [] : local.m589["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m589["permission_resources"], null) == null ? [] : local.m589["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_ipranges" {
    for_each = try(local.m589["replication_ipranges"], null) == null ? [] : local.m589["replication_ipranges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_vlan" {
    for_each = try(local.m589["replication_vlan"], null) == null ? [] : local.m589["replication_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m589["tags"], null) == null ? [] : local.m589["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m589["version_context"], null) == null ? [] : local.m589["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
