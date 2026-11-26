# Sample data source intersight_vnic_eth_adapter_policy — reads ../models/data_intersight_vnic_eth_adapter_policy.yml
locals { m1452 = yamldecode(file("${path.module}/../models/data_intersight_vnic_eth_adapter_policy.yml"))["data_intersight_vnic_eth_adapter_policy"] }

data "intersight_vnic_eth_adapter_policy" "n1452" {
  account_moid = try(local.m1452["account_moid"], null)
  additional_properties = try(local.m1452["additional_properties"], null)
  advanced_filter = try(local.m1452["advanced_filter"], null)
  class_id = try(local.m1452["class_id"], null)
  create_time = try(local.m1452["create_time"], null)
  description = try(local.m1452["description"], null)
  domain_group_moid = try(local.m1452["domain_group_moid"], null)
  ether_channel_pinning_enabled = try(local.m1452["ether_channel_pinning_enabled"], null)
  geneve_enabled = try(local.m1452["geneve_enabled"], null)
  id = try(local.m1452["id"], null)
  interrupt_scaling = try(local.m1452["interrupt_scaling"], null)
  mod_time = try(local.m1452["mod_time"], null)
  moid = try(local.m1452["moid"], null)
  name = try(local.m1452["name"], null)
  object_type = try(local.m1452["object_type"], null)
  owners = try(local.m1452["owners"], null)
  results = try(local.m1452["results"], null)
  rss_settings = try(local.m1452["rss_settings"], null)
  shared_scope = try(local.m1452["shared_scope"], null)
  uplink_failback_timeout = try(local.m1452["uplink_failback_timeout"], null)
  dynamic "ancestors" {
    for_each = try(local.m1452["ancestors"], null) == null ? [] : local.m1452["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "arfs_settings" {
    for_each = try(local.m1452["arfs_settings"], null) == null ? [] : local.m1452["arfs_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completion_queue_settings" {
    for_each = try(local.m1452["completion_queue_settings"], null) == null ? [] : local.m1452["completion_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interrupt_settings" {
    for_each = try(local.m1452["interrupt_settings"], null) == null ? [] : local.m1452["interrupt_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nvgre_settings" {
    for_each = try(local.m1452["nvgre_settings"], null) == null ? [] : local.m1452["nvgre_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1452["organization"], null) == null ? [] : local.m1452["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1452["parent"], null) == null ? [] : local.m1452["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1452["permission_resources"], null) == null ? [] : local.m1452["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ptp_settings" {
    for_each = try(local.m1452["ptp_settings"], null) == null ? [] : local.m1452["ptp_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "roce_settings" {
    for_each = try(local.m1452["roce_settings"], null) == null ? [] : local.m1452["roce_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rss_hash_settings" {
    for_each = try(local.m1452["rss_hash_settings"], null) == null ? [] : local.m1452["rss_hash_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rx_queue_settings" {
    for_each = try(local.m1452["rx_queue_settings"], null) == null ? [] : local.m1452["rx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1452["tags"], null) == null ? [] : local.m1452["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tcp_offload_settings" {
    for_each = try(local.m1452["tcp_offload_settings"], null) == null ? [] : local.m1452["tcp_offload_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tx_queue_settings" {
    for_each = try(local.m1452["tx_queue_settings"], null) == null ? [] : local.m1452["tx_queue_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1452["version_context"], null) == null ? [] : local.m1452["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vxlan_settings" {
    for_each = try(local.m1452["vxlan_settings"], null) == null ? [] : local.m1452["vxlan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
