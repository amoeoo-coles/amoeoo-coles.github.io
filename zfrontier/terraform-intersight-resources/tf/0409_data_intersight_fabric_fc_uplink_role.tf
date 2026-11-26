# Sample data source intersight_fabric_fc_uplink_role — reads ../models/data_intersight_fabric_fc_uplink_role.yml
locals { m409 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fc_uplink_role.yml"))["data_intersight_fabric_fc_uplink_role"] }

data "intersight_fabric_fc_uplink_role" "n409" {
  account_moid = try(local.m409["account_moid"], null)
  additional_properties = try(local.m409["additional_properties"], null)
  admin_speed = try(local.m409["admin_speed"], null)
  aggregate_port_id = try(local.m409["aggregate_port_id"], null)
  class_id = try(local.m409["class_id"], null)
  create_time = try(local.m409["create_time"], null)
  domain_group_moid = try(local.m409["domain_group_moid"], null)
  fill_pattern = try(local.m409["fill_pattern"], null)
  id = try(local.m409["id"], null)
  mod_time = try(local.m409["mod_time"], null)
  moid = try(local.m409["moid"], null)
  object_type = try(local.m409["object_type"], null)
  owners = try(local.m409["owners"], null)
  port_id = try(local.m409["port_id"], null)
  results = try(local.m409["results"], null)
  shared_scope = try(local.m409["shared_scope"], null)
  slot_id = try(local.m409["slot_id"], null)
  user_label = try(local.m409["user_label"], null)
  vsan_id = try(local.m409["vsan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m409["ancestors"], null) == null ? [] : local.m409["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m409["parent"], null) == null ? [] : local.m409["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m409["permission_resources"], null) == null ? [] : local.m409["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m409["port_policy"], null) == null ? [] : local.m409["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m409["tags"], null) == null ? [] : local.m409["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m409["version_context"], null) == null ? [] : local.m409["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
