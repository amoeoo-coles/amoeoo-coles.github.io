# 043 · data source mso_schema_template_bd · 5. Bridge domains
# Data source for MSO Schema Template Bridge Domain (BD).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_bd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/data_mso_schema_template_bd.yml"))["data_mso_schema_template_bd"]
}

data "mso_schema_template_bd" "n043" {
  name          = local.m_043["name"]
  schema_id     = local.m_043["schema_id"]
  template_name = local.m_043["template_name"]
}

output "n043_data_mso_schema_template_bd_id" {
  value = data.mso_schema_template_bd.n043.id
}
