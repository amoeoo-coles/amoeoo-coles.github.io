# 271 · resource aci_interface_config · 2. Access policies
# Manages ACI Access and Fabric Ports is only supported for ACI 5.2(7)+
# APIC class: not collected · DN: not collected
# Reads models/aci_interface_config.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_271 = yamldecode(file("${path.module}/../models/aci_interface_config.yml"))["aci_interface_config"]
}

resource "aci_interface_config" "n271" {
  admin_state  = local.m_271["admin_state"]
  annotation   = local.m_271["annotation"]
  breakout     = local.m_271["breakout"]
  description  = local.m_271["description"]
  interface    = local.m_271["interface"]
  name_alias   = local.m_271["name_alias"]
  node         = local.m_271["node"]
  pc_member    = local.m_271["pc_member"]
  policy_group = local.m_271["policy_group"]
  port_type    = local.m_271["port_type"]
  role         = local.m_271["role"]
}
