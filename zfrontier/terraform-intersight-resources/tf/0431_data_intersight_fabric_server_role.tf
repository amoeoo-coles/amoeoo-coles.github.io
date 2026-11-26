# Sample data source intersight_fabric_server_role — reads ../models/data_intersight_fabric_server_role.yml
locals { m431 = yamldecode(file("${path.module}/../models/data_intersight_fabric_server_role.yml"))["data_intersight_fabric_server_role"] }

data "intersight_fabric_server_role" "n431" {
  account_moid = try(local.m431["account_moid"], null)
  additional_properties = try(local.m431["additional_properties"], null)
  aggregate_port_id = try(local.m431["aggregate_port_id"], null)
  auto_negotiation_disabled = try(local.m431["auto_negotiation_disabled"], null)
  class_id = try(local.m431["class_id"], null)
  create_time = try(local.m431["create_time"], null)
  domain_group_moid = try(local.m431["domain_group_moid"], null)
  fec = try(local.m431["fec"], null)
  id = try(local.m431["id"], null)
  mod_time = try(local.m431["mod_time"], null)
  moid = try(local.m431["moid"], null)
  object_type = try(local.m431["object_type"], null)
  owners = try(local.m431["owners"], null)
  port_id = try(local.m431["port_id"], null)
  preferred_device_id = try(local.m431["preferred_device_id"], null)
  preferred_device_type = try(local.m431["preferred_device_type"], null)
  results = try(local.m431["results"], null)
  shared_scope = try(local.m431["shared_scope"], null)
  slot_id = try(local.m431["slot_id"], null)
  user_label = try(local.m431["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m431["ancestors"], null) == null ? [] : local.m431["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m431["parent"], null) == null ? [] : local.m431["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m431["permission_resources"], null) == null ? [] : local.m431["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m431["port_policy"], null) == null ? [] : local.m431["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m431["tags"], null) == null ? [] : local.m431["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m431["version_context"], null) == null ? [] : local.m431["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
