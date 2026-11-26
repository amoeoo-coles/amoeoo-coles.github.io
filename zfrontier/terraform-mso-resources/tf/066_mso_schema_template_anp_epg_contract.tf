# 066 · resource mso_schema_template_anp_epg_contract · 6. ANP and EPG
# Manages MSO Schema Template Application Network Profile(ANP) Endpoint Group(EPG) Contract.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_anp_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/mso_schema_template_anp_epg_contract.yml"))["mso_schema_template_anp_epg_contract"]
}

resource "mso_schema_template_anp_epg_contract" "n066" {
  anp_name               = local.m_066["anp_name"]
  contract_name          = local.m_066["contract_name"]
  contract_schema_id     = local.m_066["contract_schema_id"]
  contract_template_name = local.m_066["contract_template_name"]
  epg_name               = local.m_066["epg_name"]
  relationship_type      = local.m_066["relationship_type"]
  schema_id              = local.m_066["schema_id"]
  template_name          = local.m_066["template_name"]
}
