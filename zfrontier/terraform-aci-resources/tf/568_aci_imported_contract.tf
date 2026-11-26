# 568 · resource aci_imported_contract · 4. Application
# Manages ACI Imported Contract
# APIC class: not collected · DN: not collected
# Reads models/aci_imported_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_568 = yamldecode(file("${path.module}/../models/aci_imported_contract.yml"))["aci_imported_contract"]
}

resource "aci_imported_contract" "n568" {
  annotation        = local.m_568["annotation"]
  description       = local.m_568["description"]
  name              = local.m_568["name"]
  name_alias        = local.m_568["name_alias"]
  relation_vz_rs_if = local.m_568["relation_vz_rs_if"]
  tenant_dn         = local.m_568["tenant_dn"]
}
