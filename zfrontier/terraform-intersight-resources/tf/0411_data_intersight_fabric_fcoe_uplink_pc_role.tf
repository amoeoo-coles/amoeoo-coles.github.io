# Sample data source intersight_fabric_fcoe_uplink_pc_role — reads ../models/data_intersight_fabric_fcoe_uplink_pc_role.yml
locals { m411 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fcoe_uplink_pc_role.yml"))["data_intersight_fabric_fcoe_uplink_pc_role"] }

data "intersight_fabric_fcoe_uplink_pc_role" "n411" {
  account_moid = try(local.m411["account_moid"], null)
  additional_properties = try(local.m411["additional_properties"], null)
  admin_speed = try(local.m411["admin_speed"], null)
  class_id = try(local.m411["class_id"], null)
  create_time = try(local.m411["create_time"], null)
  domain_group_moid = try(local.m411["domain_group_moid"], null)
  fec = try(local.m411["fec"], null)
  id = try(local.m411["id"], null)
  mod_time = try(local.m411["mod_time"], null)
  moid = try(local.m411["moid"], null)
  object_type = try(local.m411["object_type"], null)
  owners = try(local.m411["owners"], null)
  pc_id = try(local.m411["pc_id"], null)
  results = try(local.m411["results"], null)
  shared_scope = try(local.m411["shared_scope"], null)
  user_label = try(local.m411["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m411["ancestors"], null) == null ? [] : local.m411["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_aggregation_policy" {
    for_each = try(local.m411["link_aggregation_policy"], null) == null ? [] : local.m411["link_aggregation_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_control_policy" {
    for_each = try(local.m411["link_control_policy"], null) == null ? [] : local.m411["link_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m411["parent"], null) == null ? [] : local.m411["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m411["permission_resources"], null) == null ? [] : local.m411["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m411["port_policy"], null) == null ? [] : local.m411["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports" {
    for_each = try(local.m411["ports"], null) == null ? [] : local.m411["ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m411["tags"], null) == null ? [] : local.m411["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m411["version_context"], null) == null ? [] : local.m411["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
