# 374 · data source aci_ip_address_block · 3. Tenant and networking
# Data source for ACI IP Address Block
# APIC class: fvnsUcastAddrBlk · DN: uni/tn-{name}/addrinst-{name}/fromaddr-[{from}]-toaddr-[{to}] | uni/tn-{name}/ap-{name}/epg-{name}/CtrlrAddrInst-{name}/fromaddr-[{from}]-toaddr-[{to}]
# Reads models/data_aci_ip_address_block.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_374 = yamldecode(file("${path.module}/../models/data_aci_ip_address_block.yml"))["data_aci_ip_address_block"]
}

data "aci_ip_address_block" "n374" {
  from      = local.m_374["from"]
  parent_dn = local.m_374["parent_dn"]
  to        = local.m_374["to"]
}

output "n374_data_aci_ip_address_block_id" {
  value = data.aci_ip_address_block.n374.id
}
