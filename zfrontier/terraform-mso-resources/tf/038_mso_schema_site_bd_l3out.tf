# 038 · resource mso_schema_site_bd_l3out · 5. Bridge domains
# Manages MSO Schema Site Bridge Domain L3out.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_bd_l3out.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_038 = yamldecode(file("${path.module}/../models/mso_schema_site_bd_l3out.yml"))["mso_schema_site_bd_l3out"]
}

resource "mso_schema_site_bd_l3out" "n038" {
  bd_name       = local.m_038["bd_name"]
  l3out_name    = local.m_038["l3out_name"]
  schema_id     = local.m_038["schema_id"]
  site_id       = local.m_038["site_id"]
  template_name = local.m_038["template_name"]
}
