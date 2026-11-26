# Sample data source intersight_fabric_span_source_vlan — reads ../models/data_intersight_fabric_span_source_vlan.yml
locals { m437 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_source_vlan.yml"))["data_intersight_fabric_span_source_vlan"] }

data "intersight_fabric_span_source_vlan" "n437" {
  account_moid = try(local.m437["account_moid"], null)
  additional_properties = try(local.m437["additional_properties"], null)
  class_id = try(local.m437["class_id"], null)
  create_time = try(local.m437["create_time"], null)
  direction = try(local.m437["direction"], null)
  domain_group_moid = try(local.m437["domain_group_moid"], null)
  id = try(local.m437["id"], null)
  mod_time = try(local.m437["mod_time"], null)
  moid = try(local.m437["moid"], null)
  object_type = try(local.m437["object_type"], null)
  owners = try(local.m437["owners"], null)
  results = try(local.m437["results"], null)
  shared_scope = try(local.m437["shared_scope"], null)
  vlan_id = try(local.m437["vlan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m437["ancestors"], null) == null ? [] : local.m437["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m437["parent"], null) == null ? [] : local.m437["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m437["permission_resources"], null) == null ? [] : local.m437["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m437["span_session"], null) == null ? [] : local.m437["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m437["tags"], null) == null ? [] : local.m437["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m437["version_context"], null) == null ? [] : local.m437["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
