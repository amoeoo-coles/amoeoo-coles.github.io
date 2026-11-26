# 086 · resource mso_schema_template_external_epg_selector · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template External Endpoint Groups selectors.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_external_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/mso_schema_template_external_epg_selector.yml"))["mso_schema_template_external_epg_selector"]
}

resource "mso_schema_template_external_epg_selector" "n086" {
  external_epg_name = local.m_086["external_epg_name"]
  name              = local.m_086["name"]
  schema_id         = local.m_086["schema_id"]
  template_name     = local.m_086["template_name"]
  dynamic "expressions" {
    for_each = local.m_086["expressions"] == null ? [] : local.m_086["expressions"]
    content {
      key      = lookup(expressions.value, "key", null)
      operator = lookup(expressions.value, "operator", null)
      value    = lookup(expressions.value, "value", null)
    }
  }
}
