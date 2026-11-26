# Sample data source intersight_fabric_uplink_pc_role — reads ../models/data_intersight_fabric_uplink_pc_role.yml
locals { m445 = yamldecode(file("${path.module}/../models/data_intersight_fabric_uplink_pc_role.yml"))["data_intersight_fabric_uplink_pc_role"] }

data "intersight_fabric_uplink_pc_role" "n445" {
  account_moid = try(local.m445["account_moid"], null)
  additional_properties = try(local.m445["additional_properties"], null)
  admin_speed = try(local.m445["admin_speed"], null)
  class_id = try(local.m445["class_id"], null)
  create_time = try(local.m445["create_time"], null)
  domain_group_moid = try(local.m445["domain_group_moid"], null)
  fec = try(local.m445["fec"], null)
  id = try(local.m445["id"], null)
  mod_time = try(local.m445["mod_time"], null)
  moid = try(local.m445["moid"], null)
  object_type = try(local.m445["object_type"], null)
  owners = try(local.m445["owners"], null)
  pc_id = try(local.m445["pc_id"], null)
  results = try(local.m445["results"], null)
  shared_scope = try(local.m445["shared_scope"], null)
  user_label = try(local.m445["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m445["ancestors"], null) == null ? [] : local.m445["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_group_policy" {
    for_each = try(local.m445["eth_network_group_policy"], null) == null ? [] : local.m445["eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_control_policy" {
    for_each = try(local.m445["flow_control_policy"], null) == null ? [] : local.m445["flow_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_aggregation_policy" {
    for_each = try(local.m445["link_aggregation_policy"], null) == null ? [] : local.m445["link_aggregation_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_control_policy" {
    for_each = try(local.m445["link_control_policy"], null) == null ? [] : local.m445["link_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_sec_policy" {
    for_each = try(local.m445["mac_sec_policy"], null) == null ? [] : local.m445["mac_sec_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m445["parent"], null) == null ? [] : local.m445["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m445["permission_resources"], null) == null ? [] : local.m445["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m445["port_policy"], null) == null ? [] : local.m445["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports" {
    for_each = try(local.m445["ports"], null) == null ? [] : local.m445["ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m445["tags"], null) == null ? [] : local.m445["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m445["version_context"], null) == null ? [] : local.m445["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
