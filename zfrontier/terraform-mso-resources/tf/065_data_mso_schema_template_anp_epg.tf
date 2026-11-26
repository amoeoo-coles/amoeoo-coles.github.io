# 065 · data source mso_schema_template_anp_epg · 6. ANP and EPG
# Data source for MSO Schema Template Application Network Profiles Endpoint Group (EPG).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_anp_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/data_mso_schema_template_anp_epg.yml"))["data_mso_schema_template_anp_epg"]
}

data "mso_schema_template_anp_epg" "n065" {
  anp_name      = local.m_065["anp_name"]
  name          = local.m_065["name"]
  schema_id     = local.m_065["schema_id"]
  template_name = local.m_065["template_name"]
}

output "n065_data_mso_schema_template_anp_epg_id" {
  value = data.mso_schema_template_anp_epg.n065.id
}
