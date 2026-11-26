# Sample data source intersight_vnic_eth_if_inventory — reads ../models/data_intersight_vnic_eth_if_inventory.yml
locals { m1455 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_if_inventory.yml"))["data_intersight_vnic_eth_if_inventory"] }

data "intersight_vnic_eth_if_inventory" "n1455" {
  account_moid = try(local.m1455["account_moid"], null)
  additional_properties = try(local.m1455["additional_properties"], null)
  class_id = try(local.m1455["class_id"], null)
  create_time = try(local.m1455["create_time"], null)
  device_mo_id = try(local.m1455["device_mo_id"], null)
  domain_group_moid = try(local.m1455["domain_group_moid"], null)
  failover_enabled = try(local.m1455["failover_enabled"], null)
  id = try(local.m1455["id"], null)
  iscsi_ip_v4_address_allocation_type = try(local.m1455["iscsi_ip_v4_address_allocation_type"], null)
  iscsi_ip_v6_address_allocation_type = try(local.m1455["iscsi_ip_v6_address_allocation_type"], null)
  iscsi_ipv4_address = try(local.m1455["iscsi_ipv4_address"], null)
  iscsi_ipv6_address = try(local.m1455["iscsi_ipv6_address"], null)
  mac_address = try(local.m1455["mac_address"], null)
  mac_address_type = try(local.m1455["mac_address_type"], null)
  mod_time = try(local.m1455["mod_time"], null)
  moid = try(local.m1455["moid"], null)
  name = try(local.m1455["name"], null)
  object_type = try(local.m1455["object_type"], null)
  order = try(local.m1455["order"], null)
  overridden_list = try(local.m1455["overridden_list"], null)
  owners = try(local.m1455["owners"], null)
  pin_group_name = try(local.m1455["pin_group_name"], null)
  results = try(local.m1455["results"], null)
  shared_scope = try(local.m1455["shared_scope"], null)
  stale = try(local.m1455["stale"], null)
  standby_vif_id = try(local.m1455["standby_vif_id"], null)
  static_mac_address = try(local.m1455["static_mac_address"], null)
  template_sync_status = try(local.m1455["template_sync_status"], null)
  vif_id = try(local.m1455["vif_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1455["ancestors"], null) == null ? [] : local.m1455["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cdn" {
    for_each = try(local.m1455["cdn"], null) == null ? [] : local.m1455["cdn"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_adapter_policy" {
    for_each = try(local.m1455["eth_adapter_policy"], null) == null ? [] : local.m1455["eth_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_network_policy" {
    for_each = try(local.m1455["eth_network_policy"], null) == null ? [] : local.m1455["eth_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "eth_qos_policy" {
    for_each = try(local.m1455["eth_qos_policy"], null) == null ? [] : local.m1455["eth_qos_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric_eth_network_control_policy" {
    for_each = try(local.m1455["fabric_eth_network_control_policy"], null) == null ? [] : local.m1455["fabric_eth_network_control_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric_eth_network_group_policy" {
    for_each = try(local.m1455["fabric_eth_network_group_policy"], null) == null ? [] : local.m1455["fabric_eth_network_group_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_lease" {
    for_each = try(local.m1455["ip_lease"], null) == null ? [] : local.m1455["ip_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_boot_policy" {
    for_each = try(local.m1455["iscsi_boot_policy"], null) == null ? [] : local.m1455["iscsi_boot_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_ip_v4_config" {
    for_each = try(local.m1455["iscsi_ip_v4_config"], null) == null ? [] : local.m1455["iscsi_ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_ip_v6_config" {
    for_each = try(local.m1455["iscsi_ip_v6_config"], null) == null ? [] : local.m1455["iscsi_ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lan_connectivity_policy" {
    for_each = try(local.m1455["lan_connectivity_policy"], null) == null ? [] : local.m1455["lan_connectivity_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lcp_vnic" {
    for_each = try(local.m1455["lcp_vnic"], null) == null ? [] : local.m1455["lcp_vnic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_lease" {
    for_each = try(local.m1455["mac_lease"], null) == null ? [] : local.m1455["mac_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_pool" {
    for_each = try(local.m1455["mac_pool"], null) == null ? [] : local.m1455["mac_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_flow_monitor_sessions" {
    for_each = try(local.m1455["net_flow_monitor_sessions"], null) == null ? [] : local.m1455["net_flow_monitor_sessions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "old_info" {
    for_each = try(local.m1455["old_info"], null) == null ? [] : local.m1455["old_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1455["parent"], null) == null ? [] : local.m1455["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1455["permission_resources"], null) == null ? [] : local.m1455["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "placement" {
    for_each = try(local.m1455["placement"], null) == null ? [] : local.m1455["placement"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sp_vnics" {
    for_each = try(local.m1455["sp_vnics"], null) == null ? [] : local.m1455["sp_vnics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m1455["src_template"], null) == null ? [] : local.m1455["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sriov_settings" {
    for_each = try(local.m1455["sriov_settings"], null) == null ? [] : local.m1455["sriov_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1455["tags"], null) == null ? [] : local.m1455["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m1455["template_actions"], null) == null ? [] : local.m1455["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_sync_errors" {
    for_each = try(local.m1455["template_sync_errors"], null) == null ? [] : local.m1455["template_sync_errors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usnic_settings" {
    for_each = try(local.m1455["usnic_settings"], null) == null ? [] : local.m1455["usnic_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1455["version_context"], null) == null ? [] : local.m1455["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmq_settings" {
    for_each = try(local.m1455["vmq_settings"], null) == null ? [] : local.m1455["vmq_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
