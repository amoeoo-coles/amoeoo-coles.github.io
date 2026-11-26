# Sample data source intersight_fabric_fcoe_uplink_role — reads ../models/data_intersight_fabric_fcoe_uplink_role.yml
locals { m412 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fcoe_uplink_role.yml"))["data_intersight_fabric_fcoe_uplink_role"] }

data "intersight_fabric_fcoe_uplink_role" "n412" {
  account_moid = try(local.m412["account_moid"], null)
  additional_properties = try(local.m412["additional_properties"], null)
  admin_speed = try(local.m412["admin_speed"], null)
  aggregate_port_id = try(local.m412["aggregate_port_id"], null)
  class_id = try(local.m412["class_id"], null)
  create_time = try(local.m412["create_time"], null)
  domain_group_moid = try(local.m412["domain_group_moid"], null)
  fec = try(local.m412["fec"], null)
  id = try(local.m412["id"], null)
  mod_time = try(local.m412["mod_time"], null)
  moid = try(local.m412["moid"], null)
  object_type = try(local.m412["object_type"], null)
  owners = try(local.m412["owners"], null)
  port_id = try(local.m412["port_id"], null)
  results = try(local.m412["results"], null)
  shared_scope = try(local.m412["shared_scope"], null)
  slot_id = try(local.m412["slot_id"], null)
  user_label = try(local.m412["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m412["ancestors"], null) == null ? [] : local.m412["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_control_policy" {
    for_each = try(local.m412["link_control_policy"], null) == null ? [] : local.m412["link_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m412["parent"], null) == null ? [] : local.m412["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m412["permission_resources"], null) == null ? [] : local.m412["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m412["port_policy"], null) == null ? [] : local.m412["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m412["tags"], null) == null ? [] : local.m412["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m412["version_context"], null) == null ? [] : local.m412["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
