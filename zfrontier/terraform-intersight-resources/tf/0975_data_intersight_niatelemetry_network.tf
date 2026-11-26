# Sample data source intersight_niatelemetry_network — reads ../models/data_intersight_niatelemetry_network.yml
locals { m975 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_network.yml"))["data_intersight_niatelemetry_network"] }

data "intersight_niatelemetry_network" "n975" {
  account_moid = try(local.m975["account_moid"], null)
  additional_properties = try(local.m975["additional_properties"], null)
  class_id = try(local.m975["class_id"], null)
  create_time = try(local.m975["create_time"], null)
  domain_group_moid = try(local.m975["domain_group_moid"], null)
  fabric_name = try(local.m975["fabric_name"], null)
  gateway_ipv4_address = try(local.m975["gateway_ipv4_address"], null)
  gateway_ipv6_address = try(local.m975["gateway_ipv6_address"], null)
  id = try(local.m975["id"], null)
  mod_time = try(local.m975["mod_time"], null)
  moid = try(local.m975["moid"], null)
  object_type = try(local.m975["object_type"], null)
  owners = try(local.m975["owners"], null)
  results = try(local.m975["results"], null)
  shared_scope = try(local.m975["shared_scope"], null)
  vlan_id = try(local.m975["vlan_id"], null)
  vrf_name = try(local.m975["vrf_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m975["ancestors"], null) == null ? [] : local.m975["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m975["fabric"], null) == null ? [] : local.m975["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m975["parent"], null) == null ? [] : local.m975["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m975["permission_resources"], null) == null ? [] : local.m975["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m975["tags"], null) == null ? [] : local.m975["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m975["version_context"], null) == null ? [] : local.m975["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
