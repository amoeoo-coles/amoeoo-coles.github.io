# 518 · resource aci_epg_to_contract · 4. Application
# Manages ACI EPG to contract relationship.
# APIC class: not collected · DN: not collected
# Reads models/aci_epg_to_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_518 = yamldecode(file("${path.module}/../models/aci_epg_to_contract.yml"))["aci_epg_to_contract"]
}

resource "aci_epg_to_contract" "n518" {
  annotation         = local.m_518["annotation"]
  application_epg_dn = local.m_518["application_epg_dn"]
  contract_dn        = local.m_518["contract_dn"]
  contract_type      = local.m_518["contract_type"]
  match_t            = local.m_518["match_t"]
  prio               = local.m_518["prio"]
}
