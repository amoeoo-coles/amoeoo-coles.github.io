# Sample data source intersight_fabric_port_operation — reads ../models/data_intersight_fabric_port_operation.yml
locals { m426 = yamldecode(file("${path.module}/../models/data_intersight_fabric_port_operation.yml"))["data_intersight_fabric_port_operation"] }

data "intersight_fabric_port_operation" "n426" {
  account_moid = try(local.m426["account_moid"], null)
  additional_properties = try(local.m426["additional_properties"], null)
  admin_action = try(local.m426["admin_action"], null)
  admin_state = try(local.m426["admin_state"], null)
  aggregate_port_id = try(local.m426["aggregate_port_id"], null)
  class_id = try(local.m426["class_id"], null)
  config_state = try(local.m426["config_state"], null)
  create_time = try(local.m426["create_time"], null)
  domain_group_moid = try(local.m426["domain_group_moid"], null)
  fex_id = try(local.m426["fex_id"], null)
  id = try(local.m426["id"], null)
  mod_time = try(local.m426["mod_time"], null)
  moid = try(local.m426["moid"], null)
  object_type = try(local.m426["object_type"], null)
  owners = try(local.m426["owners"], null)
  port_id = try(local.m426["port_id"], null)
  results = try(local.m426["results"], null)
  shared_scope = try(local.m426["shared_scope"], null)
  slot_id = try(local.m426["slot_id"], null)
  switch_name = try(local.m426["switch_name"], null)
  user_label = try(local.m426["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m426["ancestors"], null) == null ? [] : local.m426["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m426["network_element"], null) == null ? [] : local.m426["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m426["parent"], null) == null ? [] : local.m426["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m426["permission_resources"], null) == null ? [] : local.m426["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m426["tags"], null) == null ? [] : local.m426["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m426["version_context"], null) == null ? [] : local.m426["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
