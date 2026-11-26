# 373 · resource aci_ip_address_block · 3. Tenant and networking
# Manages ACI IP Address Block
# APIC class: fvnsUcastAddrBlk · DN: uni/tn-{name}/addrinst-{name}/fromaddr-[{from}]-toaddr-[{to}] | uni/tn-{name}/ap-{name}/epg-{name}/CtrlrAddrInst-{name}/fromaddr-[{from}]-toaddr-[{to}]
# Reads models/aci_ip_address_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_373 = yamldecode(file("${path.module}/../models/aci_ip_address_block.yml"))["aci_ip_address_block"]
}

resource "aci_ip_address_block" "n373" {
  annotation  = local.m_373["annotation"]
  annotations = local.m_373["annotations"]
  description = local.m_373["description"]
  from        = local.m_373["from"]
  name        = local.m_373["name"]
  name_alias  = local.m_373["name_alias"]
  parent_dn   = local.m_373["parent_dn"]
  tags        = local.m_373["tags"]
  to          = local.m_373["to"]
}
