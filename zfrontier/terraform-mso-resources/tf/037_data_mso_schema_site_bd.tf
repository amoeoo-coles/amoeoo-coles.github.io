# 037 · data source mso_schema_site_bd · 5. Bridge domains
# Data source for MSO Schema Site Bridge Domain (BD).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_bd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_037 = yamldecode(file("${path.module}/../models/data_mso_schema_site_bd.yml"))["data_mso_schema_site_bd"]
}

data "mso_schema_site_bd" "n037" {
  bd_name       = local.m_037["bd_name"]
  schema_id     = local.m_037["schema_id"]
  site_id       = local.m_037["site_id"]
  template_name = local.m_037["template_name"]
}

output "n037_data_mso_schema_site_bd_id" {
  value = data.mso_schema_site_bd.n037.id
}
