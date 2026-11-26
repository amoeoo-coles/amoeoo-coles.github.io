# 053 · data source mso_schema_site_anp_epg_domain · 6. ANP and EPG
# Data source for MSO Schema Site Application Network Profiles End Point Group Domain.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_anp_epg_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_053 = yamldecode(file("${path.module}/../models/data_mso_schema_site_anp_epg_domain.yml"))["data_mso_schema_site_anp_epg_domain"]
}

data "mso_schema_site_anp_epg_domain" "n053" {
  anp_name        = local.m_053["anp_name"]
  domain_dn       = local.m_053["domain_dn"]
  domain_name     = local.m_053["domain_name"]
  domain_type     = local.m_053["domain_type"]
  epg_name        = local.m_053["epg_name"]
  schema_id       = local.m_053["schema_id"]
  site_id         = local.m_053["site_id"]
  template_name   = local.m_053["template_name"]
  vmm_domain_type = local.m_053["vmm_domain_type"]
}

output "n053_data_mso_schema_site_anp_epg_domain_id" {
  value = data.mso_schema_site_anp_epg_domain.n053.id
}
