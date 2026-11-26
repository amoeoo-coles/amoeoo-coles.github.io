# 219 · resource aci_lacp_member_policy · 2. Access policies
# Manages ACI LACP Member Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_lacp_member_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_219 = yamldecode(file("${path.module}/../models/aci_lacp_member_policy.yml"))["aci_lacp_member_policy"]
}

resource "aci_lacp_member_policy" "n219" {
  annotation    = local.m_219["annotation"]
  description   = local.m_219["description"]
  name          = local.m_219["name"]
  name_alias    = local.m_219["name_alias"]
  priority      = local.m_219["priority"]
  transmit_rate = local.m_219["transmit_rate"]
}
