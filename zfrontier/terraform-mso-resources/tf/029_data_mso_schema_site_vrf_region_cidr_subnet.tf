# 029 · data source mso_schema_site_vrf_region_cidr_subnet · 4. VRF
# Data source for MSO Schema Site VRF Region CIDR Subnet.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_vrf_region_cidr_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_029 = yamldecode(file("${path.module}/../models/data_mso_schema_site_vrf_region_cidr_subnet.yml"))["data_mso_schema_site_vrf_region_cidr_subnet"]
}

data "mso_schema_site_vrf_region_cidr_subnet" "n029" {
  cidr_ip       = local.m_029["cidr_ip"]
  ip            = local.m_029["ip"]
  region_name   = local.m_029["region_name"]
  schema_id     = local.m_029["schema_id"]
  site_id       = local.m_029["site_id"]
  template_name = local.m_029["template_name"]
  vrf_name      = local.m_029["vrf_name"]
}

output "n029_data_mso_schema_site_vrf_region_cidr_subnet_id" {
  value = data.mso_schema_site_vrf_region_cidr_subnet.n029.id
}
