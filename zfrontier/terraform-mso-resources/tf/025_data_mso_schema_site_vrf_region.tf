# 025 · data source mso_schema_site_vrf_region · 4. VRF
# Data source for MSO Schema Site VRF Region.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_vrf_region.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/data_mso_schema_site_vrf_region.yml"))["data_mso_schema_site_vrf_region"]
}

data "mso_schema_site_vrf_region" "n025" {
  region_name   = local.m_025["region_name"]
  schema_id     = local.m_025["schema_id"]
  site_id       = local.m_025["site_id"]
  template_name = local.m_025["template_name"]
  vrf_name      = local.m_025["vrf_name"]
}

output "n025_data_mso_schema_site_vrf_region_id" {
  value = data.mso_schema_site_vrf_region.n025.id
}
