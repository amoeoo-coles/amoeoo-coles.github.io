# 109 · resource mso_service_device_cluster_site · 9. Service graphs and devices
# Manages the site-specific configuration of a Service Device Cluster on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/mso_service_device_cluster_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_109 = yamldecode(file("${path.module}/../models/mso_service_device_cluster_site.yml"))["mso_service_device_cluster_site"]
}

resource "mso_service_device_cluster_site" "n109" {
  domain_dn              = local.m_109["domain_dn"]
  domain_name            = local.m_109["domain_name"]
  domain_type            = local.m_109["domain_type"]
  high_availability_mode = local.m_109["high_availability_mode"]
  name                   = local.m_109["name"]
  promiscuous_mode       = local.m_109["promiscuous_mode"]
  site_id                = local.m_109["site_id"]
  template_id            = local.m_109["template_id"]
  trunking_port          = local.m_109["trunking_port"]
  vlan                   = local.m_109["vlan"]
  vmm_domain_type        = local.m_109["vmm_domain_type"]
  dynamic "interfaces" {
    for_each = local.m_109["interfaces"] == null ? [] : local.m_109["interfaces"]
    content {
      domain_dn           = lookup(interfaces.value, "domain_dn", null)
      domain_name         = lookup(interfaces.value, "domain_name", null)
      enhanced_lag_policy = lookup(interfaces.value, "enhanced_lag_policy", null)
      name                = lookup(interfaces.value, "name", null)
      vlan                = lookup(interfaces.value, "vlan", null)
      dynamic "fabric_to_device_connectivity" {
        for_each = lookup(interfaces.value, "fabric_to_device_connectivity", null) == null ? [] : interfaces.value["fabric_to_device_connectivity"]
        content {
          node_id   = lookup(fabric_to_device_connectivity.value, "node_id", null)
          path      = lookup(fabric_to_device_connectivity.value, "path", null)
          pod_id    = lookup(fabric_to_device_connectivity.value, "pod_id", null)
          port_type = lookup(fabric_to_device_connectivity.value, "port_type", null)
          tag       = lookup(fabric_to_device_connectivity.value, "tag", null)
          vlan      = lookup(fabric_to_device_connectivity.value, "vlan", null)
        }
      }
      dynamic "pbr_destinations" {
        for_each = lookup(interfaces.value, "pbr_destinations", null) == null ? [] : interfaces.value["pbr_destinations"]
        content {
          additional_tracking_ip = lookup(pbr_destinations.value, "additional_tracking_ip", null)
          ip                     = lookup(pbr_destinations.value, "ip", null)
          is_backup              = lookup(pbr_destinations.value, "is_backup", null)
          mac                    = lookup(pbr_destinations.value, "mac", null)
          pod_id                 = lookup(pbr_destinations.value, "pod_id", null)
          tag                    = lookup(pbr_destinations.value, "tag", null)
          weight                 = lookup(pbr_destinations.value, "weight", null)
        }
      }
      dynamic "vm_information" {
        for_each = lookup(interfaces.value, "vm_information", null) == null ? [] : interfaces.value["vm_information"]
        content {
          node_id   = lookup(vm_information.value, "node_id", null)
          path      = lookup(vm_information.value, "path", null)
          pod_id    = lookup(vm_information.value, "pod_id", null)
          port_type = lookup(vm_information.value, "port_type", null)
          vm_name   = lookup(vm_information.value, "vm_name", null)
          vnic_name = lookup(vm_information.value, "vnic_name", null)
        }
      }
    }
  }
}
