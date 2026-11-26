# 031 · data source mso_schema_site_vrf_route_leak · 4. VRF
# Data source for MSO Schema Site VRF Route Leak.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_vrf_route_leak.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/data_mso_schema_site_vrf_route_leak.yml"))["data_mso_schema_site_vrf_route_leak"]
}

data "mso_schema_site_vrf_route_leak" "n031" {
  schema_id                = local.m_031["schema_id"]
  site_id                  = local.m_031["site_id"]
  target_vrf_name          = local.m_031["target_vrf_name"]
  target_vrf_schema_id     = local.m_031["target_vrf_schema_id"]
  target_vrf_template_name = local.m_031["target_vrf_template_name"]
  template_name            = local.m_031["template_name"]
  vrf_name                 = local.m_031["vrf_name"]
}

output "n031_data_mso_schema_site_vrf_route_leak_id" {
  value = data.mso_schema_site_vrf_route_leak.n031.id
}
