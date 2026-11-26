# 050 · resource mso_schema_site_anp_epg_bulk_staticport · 6. ANP and EPG
# Manages MSO Schema Site Application Network Profiles Endpoint Groups Bulk Static Port.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_bulk_staticport.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_bulk_staticport.yml"))["mso_schema_site_anp_epg_bulk_staticport"]
}

resource "mso_schema_site_anp_epg_bulk_staticport" "n050" {
  anp_name      = local.m_050["anp_name"]
  epg_name      = local.m_050["epg_name"]
  schema_id     = local.m_050["schema_id"]
  site_id       = local.m_050["site_id"]
  template_name = local.m_050["template_name"]
  dynamic "static_ports" {
    for_each = local.m_050["static_ports"] == null ? [] : local.m_050["static_ports"]
    content {
      deployment_immediacy = lookup(static_ports.value, "deployment_immediacy", null)
      fex                  = lookup(static_ports.value, "fex", null)
      leaf                 = lookup(static_ports.value, "leaf", null)
      micro_seg_vlan       = lookup(static_ports.value, "micro_seg_vlan", null)
      mode                 = lookup(static_ports.value, "mode", null)
      path                 = lookup(static_ports.value, "path", null)
      path_type            = lookup(static_ports.value, "path_type", null)
      pod                  = lookup(static_ports.value, "pod", null)
      vlan                 = lookup(static_ports.value, "vlan", null)
    }
  }
}
