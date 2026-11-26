# 067 · data source mso_schema_template_anp_epg_contract · 6. ANP and EPG
# Data source for MSO Schema Template Application Network Profiles Endpoint Group Contract.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_anp_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/data_mso_schema_template_anp_epg_contract.yml"))["data_mso_schema_template_anp_epg_contract"]
}

data "mso_schema_template_anp_epg_contract" "n067" {
  anp_name               = local.m_067["anp_name"]
  contract_name          = local.m_067["contract_name"]
  contract_schema_id     = local.m_067["contract_schema_id"]
  contract_template_name = local.m_067["contract_template_name"]
  epg_name               = local.m_067["epg_name"]
  relationship_type      = local.m_067["relationship_type"]
  schema_id              = local.m_067["schema_id"]
  template_name          = local.m_067["template_name"]
}

output "n067_data_mso_schema_template_anp_epg_contract_id" {
  value = data.mso_schema_template_anp_epg_contract.n067.id
}
