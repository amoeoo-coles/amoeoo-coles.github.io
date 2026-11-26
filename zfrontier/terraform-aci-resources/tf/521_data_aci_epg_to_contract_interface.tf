# 521 · data source aci_epg_to_contract_interface · 4. Application
# Data source for ACI Contract Interface Relationship
# APIC class: not collected · DN: not collected
# Reads models/data_aci_epg_to_contract_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_521 = yamldecode(file("${path.module}/../models/data_aci_epg_to_contract_interface.yml"))["data_aci_epg_to_contract_interface"]
}

data "aci_epg_to_contract_interface" "n521" {
  annotation            = local.m_521["annotation"]
  application_epg_dn    = local.m_521["application_epg_dn"]
  contract_interface_dn = local.m_521["contract_interface_dn"]
  description           = local.m_521["description"]
  name_alias            = local.m_521["name_alias"]
  prio                  = local.m_521["prio"]
}

output "n521_data_aci_epg_to_contract_interface_id" {
  value = data.aci_epg_to_contract_interface.n521.id
}
