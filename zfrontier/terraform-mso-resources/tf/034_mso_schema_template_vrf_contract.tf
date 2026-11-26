# 034 · resource mso_schema_template_vrf_contract · 4. VRF
# Manages MSO Resource Schema Template Vrf Contract.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_vrf_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/mso_schema_template_vrf_contract.yml"))["mso_schema_template_vrf_contract"]
}

resource "mso_schema_template_vrf_contract" "n034" {
  contract_name          = local.m_034["contract_name"]
  contract_schema_id     = local.m_034["contract_schema_id"]
  contract_template_name = local.m_034["contract_template_name"]
  relationship_type      = local.m_034["relationship_type"]
  schema_id              = local.m_034["schema_id"]
  template_name          = local.m_034["template_name"]
  vrf_name               = local.m_034["vrf_name"]
}
