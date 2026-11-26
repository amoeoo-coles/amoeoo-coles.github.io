# 091 · data source mso_schema_template_filter_entry · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template Filter Entry.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_filter_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/data_mso_schema_template_filter_entry.yml"))["data_mso_schema_template_filter_entry"]
}

data "mso_schema_template_filter_entry" "n091" {
  entry_name    = local.m_091["entry_name"]
  name          = local.m_091["name"]
  schema_id     = local.m_091["schema_id"]
  template_name = local.m_091["template_name"]
}

output "n091_data_mso_schema_template_filter_entry_id" {
  value = data.mso_schema_template_filter_entry.n091.id
}
