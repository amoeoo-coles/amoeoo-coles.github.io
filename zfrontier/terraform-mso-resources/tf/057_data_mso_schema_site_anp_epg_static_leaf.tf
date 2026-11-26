# 057 · data source mso_schema_site_anp_epg_static_leaf · 6. ANP and EPG
# Data source for MSO Schema Site Application Network Profiles End Point Group Static Leaf.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_static_leaf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_static_leaf.yml"))["data_mso_schema_site_anp_epg_static_leaf"]
}

data "mso_schema_site_anp_epg_static_leaf" "n057" {
  anp_name      = local.m_057["anp_name"]
  epg_name      = local.m_057["epg_name"]
  path          = local.m_057["path"]
  schema_id     = local.m_057["schema_id"]
  site_id       = local.m_057["site_id"]
  template_name = local.m_057["template_name"]
}

output "n057_data_mso_schema_site_anp_epg_static_leaf_id" {
  value = data.mso_schema_site_anp_epg_static_leaf.n057.id
}
