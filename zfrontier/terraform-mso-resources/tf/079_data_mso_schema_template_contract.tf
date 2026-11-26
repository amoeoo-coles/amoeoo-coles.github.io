# 079 · data source mso_schema_template_contract · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template Contract.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_079 = yamldecode(file("${path.module}/../models/data_mso_schema_template_contract.yml"))["data_mso_schema_template_contract"]
}

data "mso_schema_template_contract" "n079" {
  contract_name = local.m_079["contract_name"]
  schema_id     = local.m_079["schema_id"]
  template_name = local.m_079["template_name"]
}

output "n079_data_mso_schema_template_contract_id" {
  value = data.mso_schema_template_contract.n079.id
}
