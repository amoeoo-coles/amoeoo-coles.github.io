# 205 · resource aci_access_sub_port_block · 2. Access policies
# Manages ACI Access Sub Port Block
# APIC class: not collected · DN: not collected
# Reads models/aci_access_sub_port_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_205 = yamldecode(file("${path.module}/../models/aci_access_sub_port_block.yml"))["aci_access_sub_port_block"]
}

resource "aci_access_sub_port_block" "n205" {
  access_port_selector_dn = local.m_205["access_port_selector_dn"]
  annotation              = local.m_205["annotation"]
  description             = local.m_205["description"]
  from_card               = local.m_205["from_card"]
  from_port               = local.m_205["from_port"]
  from_sub_port           = local.m_205["from_sub_port"]
  name                    = local.m_205["name"]
  name_alias              = local.m_205["name_alias"]
  to_card                 = local.m_205["to_card"]
  to_port                 = local.m_205["to_port"]
  to_sub_port             = local.m_205["to_sub_port"]
}
