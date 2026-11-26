# 084 · resource mso_schema_template_external_epg_contract · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template External Endpoint Group Contract.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_external_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/mso_schema_template_external_epg_contract.yml"))["mso_schema_template_external_epg_contract"]
}

resource "mso_schema_template_external_epg_contract" "n084" {
  contract_name          = local.m_084["contract_name"]
  contract_schema_id     = local.m_084["contract_schema_id"]
  contract_template_name = local.m_084["contract_template_name"]
  external_epg_name      = local.m_084["external_epg_name"]
  relationship_type      = local.m_084["relationship_type"]
  schema_id              = local.m_084["schema_id"]
  template_name          = local.m_084["template_name"]
}
