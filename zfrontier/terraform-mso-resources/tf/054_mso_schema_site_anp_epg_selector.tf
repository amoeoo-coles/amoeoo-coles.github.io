# 054 · resource mso_schema_site_anp_epg_selector · 6. ANP and EPG
# Manages MSO Schema site Application Network Profiles Endpoint Groups selectors.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_selector.yml"))["mso_schema_site_anp_epg_selector"]
}

resource "mso_schema_site_anp_epg_selector" "n054" {
  anp_name      = local.m_054["anp_name"]
  epg_name      = local.m_054["epg_name"]
  name          = local.m_054["name"]
  schema_id     = local.m_054["schema_id"]
  site_id       = local.m_054["site_id"]
  template_name = local.m_054["template_name"]
  dynamic "expressions" {
    for_each = local.m_054["expressions"] == null ? [] : local.m_054["expressions"]
    content {
      key      = lookup(expressions.value, "key", null)
      operator = lookup(expressions.value, "operator", null)
      value    = lookup(expressions.value, "value", null)
    }
  }
}
