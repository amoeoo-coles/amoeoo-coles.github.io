# 014 · resource mso_schema · 3. Schema and templates
# Manages MSO Schema
# Class: not collected · DN: not collected
# Reads models/mso_schema.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/mso_schema.yml"))["mso_schema"]
}

resource "mso_schema" "n014" {
  description   = local.m_014["description"]
  name          = local.m_014["name"]
  template_name = local.m_014["template_name"]
  tenant_id     = local.m_014["tenant_id"]
  dynamic "template" {
    for_each = local.m_014["template"] == null ? [] : local.m_014["template"]
    content {
      description   = lookup(template.value, "description", null)
      display_name  = lookup(template.value, "display_name", null)
      name          = lookup(template.value, "name", null)
      template_type = lookup(template.value, "template_type", null)
      tenant_id     = lookup(template.value, "tenant_id", null)
    }
  }
}
