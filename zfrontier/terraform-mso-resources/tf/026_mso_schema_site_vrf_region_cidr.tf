# 026 · resource mso_schema_site_vrf_region_cidr · 4. VRF
# Manages MSO Schema Site Vrf Region Cidr.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_vrf_region_cidr.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/mso_schema_site_vrf_region_cidr.yml"))["mso_schema_site_vrf_region_cidr"]
}

resource "mso_schema_site_vrf_region_cidr" "n026" {
  ip            = local.m_026["ip"]
  primary       = local.m_026["primary"]
  region_name   = local.m_026["region_name"]
  schema_id     = local.m_026["schema_id"]
  site_id       = local.m_026["site_id"]
  template_name = local.m_026["template_name"]
  vrf_name      = local.m_026["vrf_name"]
}
