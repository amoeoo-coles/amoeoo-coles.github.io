# 045 · data source mso_schema_template_bd_subnet · 5. Bridge domains
# Data source for MSO Schema Template Bridge Domain (BD) Subnet.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_045 = yamldecode(file("${path.module}/../models/data_mso_schema_template_bd_subnet.yml"))["data_mso_schema_template_bd_subnet"]
}

data "mso_schema_template_bd_subnet" "n045" {
  bd_name       = local.m_045["bd_name"]
  ip            = local.m_045["ip"]
  schema_id     = local.m_045["schema_id"]
  template_name = local.m_045["template_name"]
}

output "n045_data_mso_schema_template_bd_subnet_id" {
  value = data.mso_schema_template_bd_subnet.n045.id
}
