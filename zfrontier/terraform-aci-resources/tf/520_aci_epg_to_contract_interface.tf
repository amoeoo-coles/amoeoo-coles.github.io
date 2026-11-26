# 520 · resource aci_epg_to_contract_interface · 4. Application
# Manages ACI Contract Interface Relationship
# APIC class: not collected · DN: not collected
# Reads models/aci_epg_to_contract_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_520 = yamldecode(file("${path.module}/../models/aci_epg_to_contract_interface.yml"))["aci_epg_to_contract_interface"]
}

resource "aci_epg_to_contract_interface" "n520" {
  annotation            = local.m_520["annotation"]
  application_epg_dn    = local.m_520["application_epg_dn"]
  contract_interface_dn = local.m_520["contract_interface_dn"]
  description           = local.m_520["description"]
  prio                  = local.m_520["prio"]
}
