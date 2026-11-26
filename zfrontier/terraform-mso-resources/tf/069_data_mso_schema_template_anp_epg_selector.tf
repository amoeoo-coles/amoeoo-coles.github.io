# 069 · data source mso_schema_template_anp_epg_selector · 6. ANP and EPG
# Data source for MSO Schema Template Application Network Profiles Endpoint Group Selector.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_anp_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/data_mso_schema_template_anp_epg_selector.yml"))["data_mso_schema_template_anp_epg_selector"]
}

data "mso_schema_template_anp_epg_selector" "n069" {
  anp_name      = local.m_069["anp_name"]
  epg_name      = local.m_069["epg_name"]
  name          = local.m_069["name"]
  schema_id     = local.m_069["schema_id"]
  template_name = local.m_069["template_name"]
}

output "n069_data_mso_schema_template_anp_epg_selector_id" {
  value = data.mso_schema_template_anp_epg_selector.n069.id
}
