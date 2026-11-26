# 089 · data source mso_schema_template_external_epg_subnet · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template External EPG Subnet.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_external_epg_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_089 = yamldecode(file("${path.module}/../models/data_mso_schema_template_external_epg_subnet.yml"))["data_mso_schema_template_external_epg_subnet"]
}

data "mso_schema_template_external_epg_subnet" "n089" {
  external_epg_name = local.m_089["external_epg_name"]
  ip                = local.m_089["ip"]
  schema_id         = local.m_089["schema_id"]
  template_name     = local.m_089["template_name"]
}

output "n089_data_mso_schema_template_external_epg_subnet_id" {
  value = data.mso_schema_template_external_epg_subnet.n089.id
}
