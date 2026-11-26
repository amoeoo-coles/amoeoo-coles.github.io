# 068 · resource mso_schema_template_anp_epg_selector · 6. ANP and EPG
# Manages MSO Schema Template Application Network Profiles Endpoint Groups selectors.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/mso_schema_template_anp_epg_selector.yml"))["mso_schema_template_anp_epg_selector"]
}

resource "mso_schema_template_anp_epg_selector" "n068" {
  anp_name      = local.m_068["anp_name"]
  epg_name      = local.m_068["epg_name"]
  name          = local.m_068["name"]
  schema_id     = local.m_068["schema_id"]
  template_name = local.m_068["template_name"]
  dynamic "expressions" {
    for_each = local.m_068["expressions"] == null ? [] : local.m_068["expressions"]
    content {
      key      = lookup(expressions.value, "key", null)
      operator = lookup(expressions.value, "operator", null)
      value    = lookup(expressions.value, "value", null)
    }
  }
}
