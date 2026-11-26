# 035 · data source mso_schema_template_vrf_contract · 4. VRF
# Data Source for MSO Schema Template VRF Contract.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_vrf_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/data_mso_schema_template_vrf_contract.yml"))["data_mso_schema_template_vrf_contract"]
}

data "mso_schema_template_vrf_contract" "n035" {
  contract_name          = local.m_035["contract_name"]
  contract_schema_id     = local.m_035["contract_schema_id"]
  contract_template_name = local.m_035["contract_template_name"]
  relationship_type      = local.m_035["relationship_type"]
  schema_id              = local.m_035["schema_id"]
  template_name          = local.m_035["template_name"]
  vrf_name               = local.m_035["vrf_name"]
}

output "n035_data_mso_schema_template_vrf_contract_id" {
  value = data.mso_schema_template_vrf_contract.n035.id
}
