# 036 · resource mso_schema_site_bd · 5. Bridge domains
# Manages MSO Schema Site Bridge Domain(BD).
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_bd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/mso_schema_site_bd.yml"))["mso_schema_site_bd"]
}

resource "mso_schema_site_bd" "n036" {
  bd_name       = local.m_036["bd_name"]
  host_route    = local.m_036["host_route"]
  schema_id     = local.m_036["schema_id"]
  site_id       = local.m_036["site_id"]
  svi_mac       = local.m_036["svi_mac"]
  template_name = local.m_036["template_name"]
}
