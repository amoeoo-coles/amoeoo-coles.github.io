# Sample data source intersight_fabric_uplink_role — reads ../models/data_intersight_fabric_uplink_role.yml
locals { m446 = yamldecode(file("${path.module}/../models/data_intersight_fabric_uplink_role.yml"))["data_intersight_fabric_uplink_role"] }

data "intersight_fabric_uplink_role" "n446" {
  account_moid = try(local.m446["account_moid"], null)
  additional_properties = try(local.m446["additional_properties"], null)
  admin_speed = try(local.m446["admin_speed"], null)
  aggregate_port_id = try(local.m446["aggregate_port_id"], null)
  class_id = try(local.m446["class_id"], null)
  create_time = try(local.m446["create_time"], null)
  domain_group_moid = try(local.m446["domain_group_moid"], null)
  fec = try(local.m446["fec"], null)
  id = try(local.m446["id"], null)
  mod_time = try(local.m446["mod_time"], null)
  moid = try(local.m446["moid"], null)
  object_type = try(local.m446["object_type"], null)
  owners = try(local.m446["owners"], null)
  port_id = try(local.m446["port_id"], null)
  results = try(local.m446["results"], null)
  shared_scope = try(local.m446["shared_scope"], null)
  slot_id = try(local.m446["slot_id"], null)
  user_label = try(local.m446["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m446["ancestors"], null) == null ? [] : local.m446["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_group_policy" {
    for_each = try(local.m446["eth_network_group_policy"], null) == null ? [] : local.m446["eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_control_policy" {
    for_each = try(local.m446["flow_control_policy"], null) == null ? [] : local.m446["flow_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_control_policy" {
    for_each = try(local.m446["link_control_policy"], null) == null ? [] : local.m446["link_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_sec_policy" {
    for_each = try(local.m446["mac_sec_policy"], null) == null ? [] : local.m446["mac_sec_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m446["parent"], null) == null ? [] : local.m446["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m446["permission_resources"], null) == null ? [] : local.m446["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m446["port_policy"], null) == null ? [] : local.m446["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m446["tags"], null) == null ? [] : local.m446["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m446["version_context"], null) == null ? [] : local.m446["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
