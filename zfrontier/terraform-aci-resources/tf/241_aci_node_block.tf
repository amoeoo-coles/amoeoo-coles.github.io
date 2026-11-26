# 241 · resource aci_node_block · 2. Access policies
# Manages ACI Node Block
# APIC class: not collected · DN: not collected
# Reads models/aci_node_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_241 = yamldecode(file("${path.module}/../models/aci_node_block.yml"))["aci_node_block"]
}

resource "aci_node_block" "n241" {
  annotation            = local.m_241["annotation"]
  description           = local.m_241["description"]
  from_                 = local.m_241["from_"]
  name                  = local.m_241["name"]
  name_alias            = local.m_241["name_alias"]
  switch_association_dn = local.m_241["switch_association_dn"]
  to_                   = local.m_241["to_"]
}
