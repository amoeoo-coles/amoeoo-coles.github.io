# 022 · resource mso_schema_site_vrf · 4. VRF
# Manages MSO Schema Site VRF.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/mso_schema_site_vrf.yml"))["mso_schema_site_vrf"]
}

resource "mso_schema_site_vrf" "n022" {
  schema_id     = local.m_022["schema_id"]
  site_id       = local.m_022["site_id"]
  template_name = local.m_022["template_name"]
  vrf_name      = local.m_022["vrf_name"]
}
