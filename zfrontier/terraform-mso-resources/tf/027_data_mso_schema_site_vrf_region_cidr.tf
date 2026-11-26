# 027 · data source mso_schema_site_vrf_region_cidr · 4. VRF
# Data source for MSO Schema Site VRF Region CIDR.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_vrf_region_cidr.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/data_mso_schema_site_vrf_region_cidr.yml"))["data_mso_schema_site_vrf_region_cidr"]
}

data "mso_schema_site_vrf_region_cidr" "n027" {
  ip            = local.m_027["ip"]
  region_name   = local.m_027["region_name"]
  schema_id     = local.m_027["schema_id"]
  site_id       = local.m_027["site_id"]
  template_name = local.m_027["template_name"]
  vrf_name      = local.m_027["vrf_name"]
}

output "n027_data_mso_schema_site_vrf_region_cidr_id" {
  value = data.mso_schema_site_vrf_region_cidr.n027.id
}
