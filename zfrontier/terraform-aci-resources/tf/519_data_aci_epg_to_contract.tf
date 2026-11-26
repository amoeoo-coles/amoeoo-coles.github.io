# 519 · data source aci_epg_to_contract · 4. Application
# Data source for ACI EPG to contract relationship.
# APIC class: not collected · DN: not collected
# Reads models/data_aci_epg_to_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_519 = yamldecode(file("${path.module}/../models/data_aci_epg_to_contract.yml"))["data_aci_epg_to_contract"]
}

data "aci_epg_to_contract" "n519" {
  application_epg_dn = local.m_519["application_epg_dn"]
  contract_dn        = local.m_519["contract_dn"]
  contract_name      = local.m_519["contract_name"]
  contract_type      = local.m_519["contract_type"]
}

output "n519_data_aci_epg_to_contract_id" {
  value = data.aci_epg_to_contract.n519.id
}
