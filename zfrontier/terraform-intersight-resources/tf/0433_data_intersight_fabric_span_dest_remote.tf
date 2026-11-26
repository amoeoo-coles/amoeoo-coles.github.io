# Sample data source intersight_fabric_span_dest_remote — reads ../models/data_intersight_fabric_span_dest_remote.yml
locals { m433 = yamldecode(file("${path.module}/../models/data_intersight_fabric_span_dest_remote.yml"))["data_intersight_fabric_span_dest_remote"] }

data "intersight_fabric_span_dest_remote" "n433" {
  account_moid = try(local.m433["account_moid"], null)
  additional_properties = try(local.m433["additional_properties"], null)
  class_id = try(local.m433["class_id"], null)
  create_time = try(local.m433["create_time"], null)
  destination_ip = try(local.m433["destination_ip"], null)
  domain_group_moid = try(local.m433["domain_group_moid"], null)
  erspan_id = try(local.m433["erspan_id"], null)
  id = try(local.m433["id"], null)
  ip_dscp = try(local.m433["ip_dscp"], null)
  ip_ttl = try(local.m433["ip_ttl"], null)
  mod_time = try(local.m433["mod_time"], null)
  moid = try(local.m433["moid"], null)
  mtu = try(local.m433["mtu"], null)
  object_type = try(local.m433["object_type"], null)
  owners = try(local.m433["owners"], null)
  packet_truncation = try(local.m433["packet_truncation"], null)
  results = try(local.m433["results"], null)
  session_id = try(local.m433["session_id"], null)
  shared_scope = try(local.m433["shared_scope"], null)
  switch_id = try(local.m433["switch_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m433["ancestors"], null) == null ? [] : local.m433["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m433["parent"], null) == null ? [] : local.m433["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m433["permission_resources"], null) == null ? [] : local.m433["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "span_session" {
    for_each = try(local.m433["span_session"], null) == null ? [] : local.m433["span_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m433["tags"], null) == null ? [] : local.m433["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m433["version_context"], null) == null ? [] : local.m433["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
