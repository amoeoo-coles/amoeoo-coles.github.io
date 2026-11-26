# 063 · data source mso_schema_template_anp · 6. ANP and EPG
# Data source for MSO Schema Template Application Network Profile (ANP).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_anp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/data_mso_schema_template_anp.yml"))["data_mso_schema_template_anp"]
}

data "mso_schema_template_anp" "n063" {
  name      = local.m_063["name"]
  schema_id = local.m_063["schema_id"]
  template  = local.m_063["template"]
}

output "n063_data_mso_schema_template_anp_id" {
  value = data.mso_schema_template_anp.n063.id
}
