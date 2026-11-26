# 023 · data source mso_schema_site_vrf · 4. VRF
# Data source for MSO Schema Site VRF.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/data_mso_schema_site_vrf.yml"))["data_mso_schema_site_vrf"]
}

data "mso_schema_site_vrf" "n023" {
  schema_id     = local.m_023["schema_id"]
  site_id       = local.m_023["site_id"]
  template_name = local.m_023["template_name"]
  vrf_name      = local.m_023["vrf_name"]
}

output "n023_data_mso_schema_site_vrf_id" {
  value = data.mso_schema_site_vrf.n023.id
}
