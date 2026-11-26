# 087 · data source mso_schema_template_external_epg_selector · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template External End Point Group Selector.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_external_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/data_mso_schema_template_external_epg_selector.yml"))["data_mso_schema_template_external_epg_selector"]
}

data "mso_schema_template_external_epg_selector" "n087" {
  external_epg_name = local.m_087["external_epg_name"]
  name              = local.m_087["name"]
  schema_id         = local.m_087["schema_id"]
  template_name     = local.m_087["template_name"]
}

output "n087_data_mso_schema_template_external_epg_selector_id" {
  value = data.mso_schema_template_external_epg_selector.n087.id
}
