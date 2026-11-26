# 351 · resource aci_ospf_interface_policy · 3. Tenant and networking
# Manages ACI OSPF Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_ospf_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_351 = yamldecode(file("${path.module}/../models/aci_ospf_interface_policy.yml"))["aci_ospf_interface_policy"]
}

resource "aci_ospf_interface_policy" "n351" {
  annotation   = local.m_351["annotation"]
  cost         = local.m_351["cost"]
  ctrl         = local.m_351["ctrl"]
  dead_intvl   = local.m_351["dead_intvl"]
  description  = local.m_351["description"]
  hello_intvl  = local.m_351["hello_intvl"]
  name         = local.m_351["name"]
  name_alias   = local.m_351["name_alias"]
  nw_t         = local.m_351["nw_t"]
  pfx_suppress = local.m_351["pfx_suppress"]
  prio         = local.m_351["prio"]
  rexmit_intvl = local.m_351["rexmit_intvl"]
  tenant_dn    = local.m_351["tenant_dn"]
  xmit_delay   = local.m_351["xmit_delay"]
}
