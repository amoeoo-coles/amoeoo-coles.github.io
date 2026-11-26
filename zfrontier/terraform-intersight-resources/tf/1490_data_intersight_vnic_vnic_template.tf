# Sample data source intersight_vnic_vnic_template — reads ../models/data_intersight_vnic_vnic_template.yml
locals { m1490 = yamldecode(file("${path.module}/../models/data_intersight_vnic_vnic_template.yml"))["data_intersight_vnic_vnic_template"] }

data "intersight_vnic_vnic_template" "n1490" {
  account_moid = try(local.m1490["account_moid"], null)
  additional_properties = try(local.m1490["additional_properties"], null)
  class_id = try(local.m1490["class_id"], null)
  create_time = try(local.m1490["create_time"], null)
  description = try(local.m1490["description"], null)
  domain_group_moid = try(local.m1490["domain_group_moid"], null)
  enable_override = try(local.m1490["enable_override"], null)
  failover_enabled = try(local.m1490["failover_enabled"], null)
  id = try(local.m1490["id"], null)
  lcp_usage_count = try(local.m1490["lcp_usage_count"], null)
  mod_time = try(local.m1490["mod_time"], null)
  moid = try(local.m1490["moid"], null)
  name = try(local.m1490["name"], null)
  object_type = try(local.m1490["object_type"], null)
  owners = try(local.m1490["owners"], null)
  peer_vnic_name = try(local.m1490["peer_vnic_name"], null)
  pin_group_name = try(local.m1490["pin_group_name"], null)
  results = try(local.m1490["results"], null)
  shared_scope = try(local.m1490["shared_scope"], null)
  switch_id = try(local.m1490["switch_id"], null)
  update_status = try(local.m1490["update_status"], null)
  usage_count = try(local.m1490["usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1490["ancestors"], null) == null ? [] : local.m1490["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cdn" {
    for_each = try(local.m1490["cdn"], null) == null ? [] : local.m1490["cdn"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_adapter_policy" {
    for_each = try(local.m1490["eth_adapter_policy"], null) == null ? [] : local.m1490["eth_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_policy" {
    for_each = try(local.m1490["eth_network_policy"], null) == null ? [] : local.m1490["eth_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_qos_policy" {
    for_each = try(local.m1490["eth_qos_policy"], null) == null ? [] : local.m1490["eth_qos_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric_eth_network_control_policy" {
    for_each = try(local.m1490["fabric_eth_network_control_policy"], null) == null ? [] : local.m1490["fabric_eth_network_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric_eth_network_group_policy" {
    for_each = try(local.m1490["fabric_eth_network_group_policy"], null) == null ? [] : local.m1490["fabric_eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_boot_policy" {
    for_each = try(local.m1490["iscsi_boot_policy"], null) == null ? [] : local.m1490["iscsi_boot_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_pool" {
    for_each = try(local.m1490["mac_pool"], null) == null ? [] : local.m1490["mac_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_flow_monitor_sessions" {
    for_each = try(local.m1490["net_flow_monitor_sessions"], null) == null ? [] : local.m1490["net_flow_monitor_sessions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1490["organization"], null) == null ? [] : local.m1490["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1490["parent"], null) == null ? [] : local.m1490["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1490["permission_resources"], null) == null ? [] : local.m1490["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sriov_settings" {
    for_each = try(local.m1490["sriov_settings"], null) == null ? [] : local.m1490["sriov_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1490["tags"], null) == null ? [] : local.m1490["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1490["template_actions"], null) == null ? [] : local.m1490["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usnic_settings" {
    for_each = try(local.m1490["usnic_settings"], null) == null ? [] : local.m1490["usnic_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1490["version_context"], null) == null ? [] : local.m1490["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmq_settings" {
    for_each = try(local.m1490["vmq_settings"], null) == null ? [] : local.m1490["vmq_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
