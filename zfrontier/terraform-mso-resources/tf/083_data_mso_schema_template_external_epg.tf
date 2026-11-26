# 083 · data source mso_schema_template_external_epg · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template External End Point Group.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/data_mso_schema_template_external_epg.yml"))["data_mso_schema_template_external_epg"]
}

data "mso_schema_template_external_epg" "n083" {
  external_epg_name = local.m_083["external_epg_name"]
  schema_id         = local.m_083["schema_id"]
  template_name     = local.m_083["template_name"]
}

output "n083_data_mso_schema_template_external_epg_id" {
  value = data.mso_schema_template_external_epg.n083.id
}
