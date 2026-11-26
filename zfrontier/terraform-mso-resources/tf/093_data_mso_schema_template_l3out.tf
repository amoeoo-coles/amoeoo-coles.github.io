# 093 · data source mso_schema_template_l3out · 8. L3Out
# Data source for MSO Schema Template L3Out.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_l3out.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/data_mso_schema_template_l3out.yml"))["data_mso_schema_template_l3out"]
}

data "mso_schema_template_l3out" "n093" {
  l3out_name    = local.m_093["l3out_name"]
  schema_id     = local.m_093["schema_id"]
  template_name = local.m_093["template_name"]
}

output "n093_data_mso_schema_template_l3out_id" {
  value = data.mso_schema_template_l3out.n093.id
}
