# 047 · data source mso_schema_site_anp · 6. ANP and EPG
# Data source for MSO Schema Site Application Network Profile (ANP).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_047 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp.yml"))["data_mso_schema_site_anp"]
}

data "mso_schema_site_anp" "n047" {
  anp_name      = local.m_047["anp_name"]
  schema_id     = local.m_047["schema_id"]
  site_id       = local.m_047["site_id"]
  template_name = local.m_047["template_name"]
}

output "n047_data_mso_schema_site_anp_id" {
  value = data.mso_schema_site_anp.n047.id
}
