# 019 · data source mso_schema_template · 3. Schema and templates
# Data source for MSO Schema Template.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/data_mso_schema_template.yml"))["data_mso_schema_template"]
}

data "mso_schema_template" "n019" {
  name      = local.m_019["name"]
  schema_id = local.m_019["schema_id"]
}

output "n019_data_mso_schema_template_id" {
  value = data.mso_schema_template.n019.id
}
