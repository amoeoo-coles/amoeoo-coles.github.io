# 701 · resource aci_miscabling_protocol_interface_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/aci_miscabling_protocol_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_701 = yamldecode(file("${path.module}/../models/aci_miscabling_protocol_interface_policy.yml"))["aci_miscabling_protocol_interface_policy"]
}

resource "aci_miscabling_protocol_interface_policy" "n701" {
  admin_st    = local.m_701["admin_st"]
  annotation  = local.m_701["annotation"]
  description = local.m_701["description"]
  name        = local.m_701["name"]
  name_alias  = local.m_701["name_alias"]
}
