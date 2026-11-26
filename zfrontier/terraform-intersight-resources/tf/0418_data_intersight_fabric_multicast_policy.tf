# Sample data source intersight_fabric_multicast_policy — reads ../models/data_intersight_fabric_multicast_policy.yml
locals { m418 = yamldecode(file("${path.module}/../models/data_intersight_fabric_multicast_policy.yml"))["data_intersight_fabric_multicast_policy"] }

data "intersight_fabric_multicast_policy" "n418" {
  account_moid = try(local.m418["account_moid"], null)
  additional_properties = try(local.m418["additional_properties"], null)
  class_id = try(local.m418["class_id"], null)
  create_time = try(local.m418["create_time"], null)
  description = try(local.m418["description"], null)
  domain_group_moid = try(local.m418["domain_group_moid"], null)
  id = try(local.m418["id"], null)
  mod_time = try(local.m418["mod_time"], null)
  moid = try(local.m418["moid"], null)
  name = try(local.m418["name"], null)
  object_type = try(local.m418["object_type"], null)
  owners = try(local.m418["owners"], null)
  querier_ip_address = try(local.m418["querier_ip_address"], null)
  querier_ip_address_peer = try(local.m418["querier_ip_address_peer"], null)
  querier_state = try(local.m418["querier_state"], null)
  results = try(local.m418["results"], null)
  shared_scope = try(local.m418["shared_scope"], null)
  snooping_state = try(local.m418["snooping_state"], null)
  src_ip_proxy = try(local.m418["src_ip_proxy"], null)
  dynamic "ancestors" {
    for_each = try(local.m418["ancestors"], null) == null ? [] : local.m418["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m418["organization"], null) == null ? [] : local.m418["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m418["parent"], null) == null ? [] : local.m418["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m418["permission_resources"], null) == null ? [] : local.m418["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m418["tags"], null) == null ? [] : local.m418["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m418["version_context"], null) == null ? [] : local.m418["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
