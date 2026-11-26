# 239 · resource aci_multicast_pool_block · 2. Access policies
# Manages the ACI Multicast Address Pool Block
# APIC class: not collected · DN: not collected
# Reads models/aci_multicast_pool_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_239 = yamldecode(file("${path.module}/../models/aci_multicast_pool_block.yml"))["aci_multicast_pool_block"]
}

resource "aci_multicast_pool_block" "n239" {
  annotation        = local.m_239["annotation"]
  description       = local.m_239["description"]
  from              = local.m_239["from"]
  multicast_pool_dn = local.m_239["multicast_pool_dn"]
  name              = local.m_239["name"]
  name_alias        = local.m_239["name_alias"]
  to                = local.m_239["to"]
}
