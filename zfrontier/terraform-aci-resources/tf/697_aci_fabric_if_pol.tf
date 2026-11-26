# 697 · resource aci_fabric_if_pol · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/aci_fabric_if_pol.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_697 = yamldecode(file("${path.module}/../models/aci_fabric_if_pol.yml"))["aci_fabric_if_pol"]
}

resource "aci_fabric_if_pol" "n697" {
  annotation    = local.m_697["annotation"]
  auto_neg      = local.m_697["auto_neg"]
  description   = local.m_697["description"]
  fec_mode      = local.m_697["fec_mode"]
  link_debounce = local.m_697["link_debounce"]
  name          = local.m_697["name"]
  name_alias    = local.m_697["name_alias"]
  speed         = local.m_697["speed"]
}
