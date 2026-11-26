# 326 · data source aci_igmp_snooping_policy · 3. Tenant and networking
# Data source for ACI IGMP Snooping Policy
# APIC class: igmpSnoopPol · DN: uni/fabric/snPol-{name} | uni/tn-{name}/snPol-{name}
# Reads models/data_aci_igmp_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_326 = yamldecode(file("${path.module}/../models/data_aci_igmp_snooping_policy.yml"))["data_aci_igmp_snooping_policy"]
}

data "aci_igmp_snooping_policy" "n326" {
  name      = local.m_326["name"]
  parent_dn = local.m_326["parent_dn"]
}

output "n326_data_aci_igmp_snooping_policy_id" {
  value = data.aci_igmp_snooping_policy.n326.id
}
