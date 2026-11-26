# 041 · data source mso_schema_site_bd_subnet · 5. Bridge domains
# Data source for MSO Schema Site Bridge Domain (BD) Subnet.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/data_mso_schema_site_bd_subnet.yml"))["data_mso_schema_site_bd_subnet"]
}

data "mso_schema_site_bd_subnet" "n041" {
  bd_name       = local.m_041["bd_name"]
  ip            = local.m_041["ip"]
  schema_id     = local.m_041["schema_id"]
  site_id       = local.m_041["site_id"]
  template_name = local.m_041["template_name"]
}

output "n041_data_mso_schema_site_bd_subnet_id" {
  value = data.mso_schema_site_bd_subnet.n041.id
}
