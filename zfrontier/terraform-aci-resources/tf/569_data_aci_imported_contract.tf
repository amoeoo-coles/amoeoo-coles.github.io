# 569 · data source aci_imported_contract · 4. Application
# Data source for ACI Imported Contract
# APIC class: not collected · DN: not collected
# Reads models/data_aci_imported_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_569 = yamldecode(file("${path.module}/../models/data_aci_imported_contract.yml"))["data_aci_imported_contract"]
}

data "aci_imported_contract" "n569" {
  annotation  = local.m_569["annotation"]
  description = local.m_569["description"]
  name        = local.m_569["name"]
  name_alias  = local.m_569["name_alias"]
  tenant_dn   = local.m_569["tenant_dn"]
}

output "n569_data_aci_imported_contract_id" {
  value = data.aci_imported_contract.n569.id
}
