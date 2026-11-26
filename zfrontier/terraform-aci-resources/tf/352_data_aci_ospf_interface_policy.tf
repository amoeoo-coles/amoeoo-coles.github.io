# 352 · data source aci_ospf_interface_policy · 3. Tenant and networking
# Data source for ACI OSPF Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ospf_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_352 = yamldecode(file("${path.module}/../models/data_aci_ospf_interface_policy.yml"))["data_aci_ospf_interface_policy"]
}

data "aci_ospf_interface_policy" "n352" {
  annotation   = local.m_352["annotation"]
  cost         = local.m_352["cost"]
  ctrl         = local.m_352["ctrl"]
  dead_intvl   = local.m_352["dead_intvl"]
  description  = local.m_352["description"]
  hello_intvl  = local.m_352["hello_intvl"]
  name         = local.m_352["name"]
  name_alias   = local.m_352["name_alias"]
  nw_t         = local.m_352["nw_t"]
  pfx_suppress = local.m_352["pfx_suppress"]
  prio         = local.m_352["prio"]
  rexmit_intvl = local.m_352["rexmit_intvl"]
  tenant_dn    = local.m_352["tenant_dn"]
  xmit_delay   = local.m_352["xmit_delay"]
}

output "n352_data_aci_ospf_interface_policy_id" {
  value = data.aci_ospf_interface_policy.n352.id
}
