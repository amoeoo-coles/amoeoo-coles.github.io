# 028 · resource mso_schema_site_vrf_region_cidr_subnet · 4. VRF
# Manages MSO Schema Site Vrf Region Cidr Subnet.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_vrf_region_cidr_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/mso_schema_site_vrf_region_cidr_subnet.yml"))["mso_schema_site_vrf_region_cidr_subnet"]
}

resource "mso_schema_site_vrf_region_cidr_subnet" "n028" {
  cidr_ip       = local.m_028["cidr_ip"]
  ip            = local.m_028["ip"]
  name          = local.m_028["name"]
  region_name   = local.m_028["region_name"]
  schema_id     = local.m_028["schema_id"]
  site_id       = local.m_028["site_id"]
  subnet_group  = local.m_028["subnet_group"]
  template_name = local.m_028["template_name"]
  usage         = local.m_028["usage"]
  vrf_name      = local.m_028["vrf_name"]
  zone          = local.m_028["zone"]
}
