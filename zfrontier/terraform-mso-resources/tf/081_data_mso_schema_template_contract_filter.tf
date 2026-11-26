# 081 · data source mso_schema_template_contract_filter · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template Contract Filter.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_contract_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/data_mso_schema_template_contract_filter.yml"))["data_mso_schema_template_contract_filter"]
}

data "mso_schema_template_contract_filter" "n081" {
  contract_name        = local.m_081["contract_name"]
  filter_name          = local.m_081["filter_name"]
  filter_schema_id     = local.m_081["filter_schema_id"]
  filter_template_name = local.m_081["filter_template_name"]
  filter_type          = local.m_081["filter_type"]
  schema_id            = local.m_081["schema_id"]
  template_name        = local.m_081["template_name"]
}

output "n081_data_mso_schema_template_contract_filter_id" {
  value = data.mso_schema_template_contract_filter.n081.id
}
