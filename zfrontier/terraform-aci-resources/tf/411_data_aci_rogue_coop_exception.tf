# 411 · data source aci_rogue_coop_exception · 3. Tenant and networking
# Data source for ACI Rogue Coop Exception
# APIC class: fvRogueExceptionMac · DN: uni/tn-{name}/BD-{name}/rgexpmac-{mac}
# Reads models/data_aci_rogue_coop_exception.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_411 = yamldecode(file("${path.module}/../models/data_aci_rogue_coop_exception.yml"))["data_aci_rogue_coop_exception"]
}

data "aci_rogue_coop_exception" "n411" {
  mac       = local.m_411["mac"]
  parent_dn = local.m_411["parent_dn"]
}

output "n411_data_aci_rogue_coop_exception_id" {
  value = data.aci_rogue_coop_exception.n411.id
}
