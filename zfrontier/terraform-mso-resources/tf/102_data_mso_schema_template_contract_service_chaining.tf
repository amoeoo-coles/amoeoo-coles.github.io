# 102 · data source mso_schema_template_contract_service_chaining · 9. Service graphs and devices
# Data source for Schema Template Contract Service Chaining.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_contract_service_chaining.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/data_mso_schema_template_contract_service_chaining.yml"))["data_mso_schema_template_contract_service_chaining"]
}

data "mso_schema_template_contract_service_chaining" "n102" {
  contract_name = local.m_102["contract_name"]
  schema_id     = local.m_102["schema_id"]
  template_name = local.m_102["template_name"]
}

output "n102_data_mso_schema_template_contract_service_chaining_id" {
  value = data.mso_schema_template_contract_service_chaining.n102.id
}
