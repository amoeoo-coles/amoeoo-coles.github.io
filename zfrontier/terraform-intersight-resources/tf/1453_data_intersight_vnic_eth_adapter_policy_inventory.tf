# Sample data source intersight_vnic_eth_adapter_policy_inventory — reads ../models/data_intersight_vnic_eth_adapter_policy_inventory.yml
locals { m1453 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_adapter_policy_inventory.yml"))["data_intersight_vnic_eth_adapter_policy_inventory"] }

data "intersight_vnic_eth_adapter_policy_inventory" "n1453" {
  account_moid = try(local.m1453["account_moid"], null)
  additional_properties = try(local.m1453["additional_properties"], null)
  advanced_filter = try(local.m1453["advanced_filter"], null)
  class_id = try(local.m1453["class_id"], null)
  create_time = try(local.m1453["create_time"], null)
  description = try(local.m1453["description"], null)
  device_mo_id = try(local.m1453["device_mo_id"], null)
  domain_group_moid = try(local.m1453["domain_group_moid"], null)
  ether_channel_pinning_enabled = try(local.m1453["ether_channel_pinning_enabled"], null)
  geneve_enabled = try(local.m1453["geneve_enabled"], null)
  id = try(local.m1453["id"], null)
  interrupt_scaling = try(local.m1453["interrupt_scaling"], null)
  mod_time = try(local.m1453["mod_time"], null)
  moid = try(local.m1453["moid"], null)
  name = try(local.m1453["name"], null)
  object_type = try(local.m1453["object_type"], null)
  owners = try(local.m1453["owners"], null)
  results = try(local.m1453["results"], null)
  rss_settings = try(local.m1453["rss_settings"], null)
  shared_scope = try(local.m1453["shared_scope"], null)
  uplink_failback_timeout = try(local.m1453["uplink_failback_timeout"], null)
  dynamic "ancestors" {
    for_each = try(local.m1453["ancestors"], null) == null ? [] : local.m1453["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "arfs_settings" {
    for_each = try(local.m1453["arfs_settings"], null) == null ? [] : local.m1453["arfs_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completion_queue_settings" {
    for_each = try(local.m1453["completion_queue_settings"], null) == null ? [] : local.m1453["completion_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interrupt_settings" {
    for_each = try(local.m1453["interrupt_settings"], null) == null ? [] : local.m1453["interrupt_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nvgre_settings" {
    for_each = try(local.m1453["nvgre_settings"], null) == null ? [] : local.m1453["nvgre_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1453["parent"], null) == null ? [] : local.m1453["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1453["permission_resources"], null) == null ? [] : local.m1453["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ptp_settings" {
    for_each = try(local.m1453["ptp_settings"], null) == null ? [] : local.m1453["ptp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roce_settings" {
    for_each = try(local.m1453["roce_settings"], null) == null ? [] : local.m1453["roce_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rss_hash_settings" {
    for_each = try(local.m1453["rss_hash_settings"], null) == null ? [] : local.m1453["rss_hash_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rx_queue_settings" {
    for_each = try(local.m1453["rx_queue_settings"], null) == null ? [] : local.m1453["rx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1453["tags"], null) == null ? [] : local.m1453["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1453["target_mo"], null) == null ? [] : local.m1453["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tcp_offload_settings" {
    for_each = try(local.m1453["tcp_offload_settings"], null) == null ? [] : local.m1453["tcp_offload_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tx_queue_settings" {
    for_each = try(local.m1453["tx_queue_settings"], null) == null ? [] : local.m1453["tx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1453["version_context"], null) == null ? [] : local.m1453["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vxlan_settings" {
    for_each = try(local.m1453["vxlan_settings"], null) == null ? [] : local.m1453["vxlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
