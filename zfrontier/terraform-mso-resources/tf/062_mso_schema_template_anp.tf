# 062 · resource mso_schema_template_anp · 6. ANP and EPG
# Manages MSO Resource Schema Template ANP
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_062 = yamldecode(file("${path.module}/../models/mso_schema_template_anp.yml"))["mso_schema_template_anp"]
}

resource "mso_schema_template_anp" "n062" {
  description  = local.m_062["description"]
  display_name = local.m_062["display_name"]
  name         = local.m_062["name"]
  schema_id    = local.m_062["schema_id"]
  template     = local.m_062["template"]
}
