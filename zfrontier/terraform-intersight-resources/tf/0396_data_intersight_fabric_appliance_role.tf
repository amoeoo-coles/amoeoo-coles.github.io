# Sample data source intersight_fabric_appliance_role — reads ../models/data_intersight_fabric_appliance_role.yml
locals { m396 = yamldecode(file("${path.module}/../models/data_intersight_fabric_appliance_role.yml"))["data_intersight_fabric_appliance_role"] }

data "intersight_fabric_appliance_role" "n396" {
  account_moid = try(local.m396["account_moid"], null)
  additional_properties = try(local.m396["additional_properties"], null)
  admin_speed = try(local.m396["admin_speed"], null)
  aggregate_port_id = try(local.m396["aggregate_port_id"], null)
  class_id = try(local.m396["class_id"], null)
  create_time = try(local.m396["create_time"], null)
  domain_group_moid = try(local.m396["domain_group_moid"], null)
  fec = try(local.m396["fec"], null)
  id = try(local.m396["id"], null)
  mod_time = try(local.m396["mod_time"], null)
  mode = try(local.m396["mode"], null)
  moid = try(local.m396["moid"], null)
  object_type = try(local.m396["object_type"], null)
  owners = try(local.m396["owners"], null)
  port_id = try(local.m396["port_id"], null)
  priority = try(local.m396["priority"], null)
  results = try(local.m396["results"], null)
  shared_scope = try(local.m396["shared_scope"], null)
  slot_id = try(local.m396["slot_id"], null)
  user_label = try(local.m396["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m396["ancestors"], null) == null ? [] : local.m396["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_control_policy" {
    for_each = try(local.m396["eth_network_control_policy"], null) == null ? [] : local.m396["eth_network_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_group_policy" {
    for_each = try(local.m396["eth_network_group_policy"], null) == null ? [] : local.m396["eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flow_control_policy" {
    for_each = try(local.m396["flow_control_policy"], null) == null ? [] : local.m396["flow_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_control_policy" {
    for_each = try(local.m396["link_control_policy"], null) == null ? [] : local.m396["link_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m396["parent"], null) == null ? [] : local.m396["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m396["permission_resources"], null) == null ? [] : local.m396["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m396["port_policy"], null) == null ? [] : local.m396["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m396["tags"], null) == null ? [] : local.m396["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m396["version_context"], null) == null ? [] : local.m396["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
