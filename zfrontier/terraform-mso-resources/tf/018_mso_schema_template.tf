# 018 · resource mso_schema_template · 3. Schema and templates
# Manages MSO Schema Template
# Class: not collected · DN: not collected
# Reads models/mso_schema_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/mso_schema_template.yml"))["mso_schema_template"]
}

resource "mso_schema_template" "n018" {
  description   = local.m_018["description"]
  display_name  = local.m_018["display_name"]
  name          = local.m_018["name"]
  schema_id     = local.m_018["schema_id"]
  template_type = local.m_018["template_type"]
  tenant_id     = local.m_018["tenant_id"]
}
