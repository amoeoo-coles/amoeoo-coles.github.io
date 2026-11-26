# Sample data source intersight_fabric_appliance_pc_role — reads ../models/data_intersight_fabric_appliance_pc_role.yml
locals { m395 = yamldecode(file("${path.module}/../models/data_intersight_fabric_appliance_pc_role.yml"))["data_intersight_fabric_appliance_pc_role"] }

data "intersight_fabric_appliance_pc_role" "n395" {
  account_moid = try(local.m395["account_moid"], null)
  additional_properties = try(local.m395["additional_properties"], null)
  admin_speed = try(local.m395["admin_speed"], null)
  class_id = try(local.m395["class_id"], null)
  create_time = try(local.m395["create_time"], null)
  domain_group_moid = try(local.m395["domain_group_moid"], null)
  fec = try(local.m395["fec"], null)
  id = try(local.m395["id"], null)
  mod_time = try(local.m395["mod_time"], null)
  mode = try(local.m395["mode"], null)
  moid = try(local.m395["moid"], null)
  object_type = try(local.m395["object_type"], null)
  owners = try(local.m395["owners"], null)
  pc_id = try(local.m395["pc_id"], null)
  priority = try(local.m395["priority"], null)
  results = try(local.m395["results"], null)
  shared_scope = try(local.m395["shared_scope"], null)
  user_label = try(local.m395["user_label"], null)
  dynamic "ancestors" {
    for_each = try(local.m395["ancestors"], null) == null ? [] : local.m395["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_control_policy" {
    for_each = try(local.m395["eth_network_control_policy"], null) == null ? [] : local.m395["eth_network_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_group_policy" {
    for_each = try(local.m395["eth_network_group_policy"], null) == null ? [] : local.m395["eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "link_aggregation_policy" {
    for_each = try(local.m395["link_aggregation_policy"], null) == null ? [] : local.m395["link_aggregation_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m395["parent"], null) == null ? [] : local.m395["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m395["permission_resources"], null) == null ? [] : local.m395["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy" {
    for_each = try(local.m395["port_policy"], null) == null ? [] : local.m395["port_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ports" {
    for_each = try(local.m395["ports"], null) == null ? [] : local.m395["ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m395["tags"], null) == null ? [] : local.m395["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m395["version_context"], null) == null ? [] : local.m395["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
