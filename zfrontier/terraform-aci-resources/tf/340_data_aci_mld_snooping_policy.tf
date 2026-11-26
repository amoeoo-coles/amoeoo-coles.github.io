# 340 · data source aci_mld_snooping_policy · 3. Tenant and networking
# Data source for ACI MLD Snooping Policy
# APIC class: mldSnoopPol · DN: uni/fabric/mldsnoopPol-{name} | uni/tn-{name}/mldsnoopPol-{name}
# Reads models/data_aci_mld_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_340 = yamldecode(file("${path.module}/../models/data_aci_mld_snooping_policy.yml"))["data_aci_mld_snooping_policy"]
}

data "aci_mld_snooping_policy" "n340" {
  name      = local.m_340["name"]
  parent_dn = local.m_340["parent_dn"]
}

output "n340_data_aci_mld_snooping_policy_id" {
  value = data.aci_mld_snooping_policy.n340.id
}
