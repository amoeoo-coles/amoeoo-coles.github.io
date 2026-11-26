# 021 · data source mso_template · 3. Schema and templates
# Data source for MSO Template.
# Class: not collected · DN: not collected
# Reads models/data_mso_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/data_mso_template.yml"))["data_mso_template"]
}

data "mso_template" "n021" {
  template_id   = local.m_021["template_id"]
  template_name = local.m_021["template_name"]
  template_type = local.m_021["template_type"]
}

output "n021_data_mso_template_id" {
  value = data.mso_template.n021.id
}
