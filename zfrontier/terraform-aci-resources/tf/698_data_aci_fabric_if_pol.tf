# 698 · data source aci_fabric_if_pol · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fabric_if_pol.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_698 = yamldecode(file("${path.module}/../models/data_aci_fabric_if_pol.yml"))["data_aci_fabric_if_pol"]
}

data "aci_fabric_if_pol" "n698" {
  annotation    = local.m_698["annotation"]
  auto_neg      = local.m_698["auto_neg"]
  description   = local.m_698["description"]
  fec_mode      = local.m_698["fec_mode"]
  link_debounce = local.m_698["link_debounce"]
  name          = local.m_698["name"]
  name_alias    = local.m_698["name_alias"]
  speed         = local.m_698["speed"]
}

output "n698_data_aci_fabric_if_pol_id" {
  value = data.aci_fabric_if_pol.n698.id
}
