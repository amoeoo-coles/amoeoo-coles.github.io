# 107 · resource mso_service_device_cluster · 9. Service graphs and devices
# Manages Service Device Clusters on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_service_device_cluster.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/mso_service_device_cluster.yml"))["mso_service_device_cluster"]
}

resource "mso_service_device_cluster" "n107" {
  description = local.m_107["description"]
  device_mode = local.m_107["device_mode"]
  device_type = local.m_107["device_type"]
  name        = local.m_107["name"]
  template_id = local.m_107["template_id"]
  dynamic "interface_properties" {
    for_each = local.m_107["interface_properties"] == null ? [] : local.m_107["interface_properties"]
    content {
      anycast                      = lookup(interface_properties.value, "anycast", null)
      bd_uuid                      = lookup(interface_properties.value, "bd_uuid", null)
      config_static_mac            = lookup(interface_properties.value, "config_static_mac", null)
      external_epg_uuid            = lookup(interface_properties.value, "external_epg_uuid", null)
      ipsla_monitoring_policy_uuid = lookup(interface_properties.value, "ipsla_monitoring_policy_uuid", null)
      is_backup_redirect_ip        = lookup(interface_properties.value, "is_backup_redirect_ip", null)
      load_balance_hashing         = lookup(interface_properties.value, "load_balance_hashing", null)
      max_threshold                = lookup(interface_properties.value, "max_threshold", null)
      min_threshold                = lookup(interface_properties.value, "min_threshold", null)
      name                         = lookup(interface_properties.value, "name", null)
      pod_aware_redirection        = lookup(interface_properties.value, "pod_aware_redirection", null)
      preferred_group              = lookup(interface_properties.value, "preferred_group", null)
      qos_policy_uuid              = lookup(interface_properties.value, "qos_policy_uuid", null)
      redirect                     = lookup(interface_properties.value, "redirect", null)
      resilient_hashing            = lookup(interface_properties.value, "resilient_hashing", null)
      rewrite_source_mac           = lookup(interface_properties.value, "rewrite_source_mac", null)
      tag_based_sorting            = lookup(interface_properties.value, "tag_based_sorting", null)
      threshold_down_action        = lookup(interface_properties.value, "threshold_down_action", null)
    }
  }
}
