# 137 · resource aci_cdp_interface_policy · 2. Access policies
# Manages ACI CDP Interface Policy
# APIC class: cdpIfPol · DN: uni/infra/cdpIfP-{name}
# Reads models/aci_cdp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_137 = yamldecode(file("${path.module}/../models/aci_cdp_interface_policy.yml"))["aci_cdp_interface_policy"]
}

resource "aci_cdp_interface_policy" "n137" {
  admin_st    = local.m_137["admin_st"]
  admin_state = local.m_137["admin_state"]
  annotation  = local.m_137["annotation"]
  annotations = local.m_137["annotations"]
  description = local.m_137["description"]
  name        = local.m_137["name"]
  name_alias  = local.m_137["name_alias"]
  owner_key   = local.m_137["owner_key"]
  owner_tag   = local.m_137["owner_tag"]
  tags        = local.m_137["tags"]
}
