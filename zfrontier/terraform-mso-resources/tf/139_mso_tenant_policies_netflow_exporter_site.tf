# 139 · resource mso_tenant_policies_netflow_exporter_site · 10. Tenant policy templates
# Manages a site-specific NetFlow Exporter configuration on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_netflow_exporter_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_139 = yamldecode(file("${path.module}/../models/mso_tenant_policies_netflow_exporter_site.yml"))["mso_tenant_policies_netflow_exporter_site"]
}

resource "mso_tenant_policies_netflow_exporter_site" "n139" {
  description            = local.m_139["description"]
  destination_ip         = local.m_139["destination_ip"]
  destination_port       = local.m_139["destination_port"]
  dscp                   = local.m_139["dscp"]
  netflow_exporter_uuid  = local.m_139["netflow_exporter_uuid"]
  site_id                = local.m_139["site_id"]
  source_ip              = local.m_139["source_ip"]
  source_ip_address_type = local.m_139["source_ip_address_type"]
  template_id            = local.m_139["template_id"]
  dynamic "application_epg" {
    for_each = local.m_139["application_epg"] == null ? [] : local.m_139["application_epg"]
    content {
      anp_name        = lookup(application_epg.value, "anp_name", null)
      epg_name        = lookup(application_epg.value, "epg_name", null)
      tenant_name     = lookup(application_epg.value, "tenant_name", null)
      vrf_name        = lookup(application_epg.value, "vrf_name", null)
      vrf_tenant_name = lookup(application_epg.value, "vrf_tenant_name", null)
    }
  }
  dynamic "external_epg" {
    for_each = local.m_139["external_epg"] == null ? [] : local.m_139["external_epg"]
    content {
      external_epg_name = lookup(external_epg.value, "external_epg_name", null)
      l3out_name        = lookup(external_epg.value, "l3out_name", null)
      tenant_name       = lookup(external_epg.value, "tenant_name", null)
      vrf_name          = lookup(external_epg.value, "vrf_name", null)
      vrf_tenant_name   = lookup(external_epg.value, "vrf_tenant_name", null)
    }
  }
}
