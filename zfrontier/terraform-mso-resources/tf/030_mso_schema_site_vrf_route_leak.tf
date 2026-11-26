# 030 · resource mso_schema_site_vrf_route_leak · 4. VRF
# Manages MSO Schema Site VRF Route Leak.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_vrf_route_leak.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/mso_schema_site_vrf_route_leak.yml"))["mso_schema_site_vrf_route_leak"]
}

resource "mso_schema_site_vrf_route_leak" "n030" {
  schema_id                = local.m_030["schema_id"]
  site_id                  = local.m_030["site_id"]
  subnet_ips               = local.m_030["subnet_ips"]
  target_vrf_name          = local.m_030["target_vrf_name"]
  target_vrf_schema_id     = local.m_030["target_vrf_schema_id"]
  target_vrf_template_name = local.m_030["target_vrf_template_name"]
  template_name            = local.m_030["template_name"]
  tenant_name              = local.m_030["tenant_name"]
  type                     = local.m_030["type"]
  vrf_name                 = local.m_030["vrf_name"]
}
