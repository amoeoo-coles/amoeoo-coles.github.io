# Sample data source intersight_hyperflex_cluster_replication_network_policy_deployment — reads ../models/data_intersight_hyperflex_cluster_replication_network_policy_deployment.yml
locals { m590 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster_replication_network_policy_deployment.yml"))["data_intersight_hyperflex_cluster_replication_network_policy_deployment"] }

data "intersight_hyperflex_cluster_replication_network_policy_deployment" "n590" {
  account_moid = try(local.m590["account_moid"], null)
  additional_properties = try(local.m590["additional_properties"], null)
  class_id = try(local.m590["class_id"], null)
  cluster_uuid = try(local.m590["cluster_uuid"], null)
  create_time = try(local.m590["create_time"], null)
  description = try(local.m590["description"], null)
  discovered = try(local.m590["discovered"], null)
  domain_group_moid = try(local.m590["domain_group_moid"], null)
  id = try(local.m590["id"], null)
  mod_time = try(local.m590["mod_time"], null)
  moid = try(local.m590["moid"], null)
  name = try(local.m590["name"], null)
  object_type = try(local.m590["object_type"], null)
  owners = try(local.m590["owners"], null)
  policy_moid = try(local.m590["policy_moid"], null)
  profile_moid = try(local.m590["profile_moid"], null)
  replication_bandwidth_mbps = try(local.m590["replication_bandwidth_mbps"], null)
  replication_mtu = try(local.m590["replication_mtu"], null)
  request_id = try(local.m590["request_id"], null)
  results = try(local.m590["results"], null)
  shared_scope = try(local.m590["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m590["ancestors"], null) == null ? [] : local.m590["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m590["cluster"], null) == null ? [] : local.m590["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m590["organization"], null) == null ? [] : local.m590["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m590["parent"], null) == null ? [] : local.m590["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m590["permission_resources"], null) == null ? [] : local.m590["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_ipranges" {
    for_each = try(local.m590["replication_ipranges"], null) == null ? [] : local.m590["replication_ipranges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replication_vlan" {
    for_each = try(local.m590["replication_vlan"], null) == null ? [] : local.m590["replication_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m590["tags"], null) == null ? [] : local.m590["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m590["version_context"], null) == null ? [] : local.m590["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
