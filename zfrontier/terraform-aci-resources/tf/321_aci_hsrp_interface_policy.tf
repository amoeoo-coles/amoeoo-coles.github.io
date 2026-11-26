# 321 · resource aci_hsrp_interface_policy · 3. Tenant and networking
# Manages ACI HSRP Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_hsrp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_321 = yamldecode(file("${path.module}/../models/aci_hsrp_interface_policy.yml"))["aci_hsrp_interface_policy"]
}

resource "aci_hsrp_interface_policy" "n321" {
  annotation   = local.m_321["annotation"]
  ctrl         = local.m_321["ctrl"]
  delay        = local.m_321["delay"]
  description  = local.m_321["description"]
  name         = local.m_321["name"]
  name_alias   = local.m_321["name_alias"]
  reload_delay = local.m_321["reload_delay"]
  tenant_dn    = local.m_321["tenant_dn"]
}
