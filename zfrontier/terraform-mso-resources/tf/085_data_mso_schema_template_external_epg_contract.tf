# 085 · data source mso_schema_template_external_epg_contract · 7. Contracts, filters and external EPGs
# Data source for MSO Schema Template External End Point Group Contract.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_external_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/data_mso_schema_template_external_epg_contract.yml"))["data_mso_schema_template_external_epg_contract"]
}

data "mso_schema_template_external_epg_contract" "n085" {
  contract_name          = local.m_085["contract_name"]
  contract_schema_id     = local.m_085["contract_schema_id"]
  contract_template_name = local.m_085["contract_template_name"]
  external_epg_name      = local.m_085["external_epg_name"]
  relationship_type      = local.m_085["relationship_type"]
  schema_id              = local.m_085["schema_id"]
  template_name          = local.m_085["template_name"]
}

output "n085_data_mso_schema_template_external_epg_contract_id" {
  value = data.mso_schema_template_external_epg_contract.n085.id
}
