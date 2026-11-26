# 073 · data source mso_schema_template_anp_epg_useg_attr · 6. ANP and EPG
# Data source for MSO Schema Template Application Network Profiles Endpoint Group uSeg Attribute.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_anp_epg_useg_attr.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/data_mso_schema_template_anp_epg_useg_attr.yml"))["data_mso_schema_template_anp_epg_useg_attr"]
}

data "mso_schema_template_anp_epg_useg_attr" "n073" {
  anp_name      = local.m_073["anp_name"]
  epg_name      = local.m_073["epg_name"]
  name          = local.m_073["name"]
  schema_id     = local.m_073["schema_id"]
  template_name = local.m_073["template_name"]
}

output "n073_data_mso_schema_template_anp_epg_useg_attr_id" {
  value = data.mso_schema_template_anp_epg_useg_attr.n073.id
}
