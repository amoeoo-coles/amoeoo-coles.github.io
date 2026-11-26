# 020 · resource mso_template · 3. Schema and templates
# Manages MSO Template
# Class: not collected · DN: not collected
# Reads models/mso_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/mso_template.yml"))["mso_template"]
}

resource "mso_template" "n020" {
  sites         = local.m_020["sites"]
  template_name = local.m_020["template_name"]
  template_type = local.m_020["template_type"]
  tenant_id     = local.m_020["tenant_id"]
}
