# 072 · resource mso_schema_template_anp_epg_useg_attr · 6. ANP and EPG
# Resource for MSO Schema Template Application Network Profiles Endpoint Groups Useg Attributes.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp_epg_useg_attr.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_072 = yamldecode(file("${path.module}/../models/mso_schema_template_anp_epg_useg_attr.yml"))["mso_schema_template_anp_epg_useg_attr"]
}

resource "mso_schema_template_anp_epg_useg_attr" "n072" {
  anp_name      = local.m_072["anp_name"]
  category      = local.m_072["category"]
  description   = local.m_072["description"]
  epg_name      = local.m_072["epg_name"]
  name          = local.m_072["name"]
  operator      = local.m_072["operator"]
  schema_id     = local.m_072["schema_id"]
  template_name = local.m_072["template_name"]
  useg_subnet   = local.m_072["useg_subnet"]
  useg_type     = local.m_072["useg_type"]
  value         = local.m_072["value"]
}
