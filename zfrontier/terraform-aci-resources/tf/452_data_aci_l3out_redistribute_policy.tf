# 452 · data source aci_l3out_redistribute_policy · 3. Tenant and networking
# Data source for ACI L3Out Redistribute Policy
# APIC class: l3extRsRedistributePol · DN: uni/tn-{name}/out-{name}/rsredistributePol-[{tnRtctrlProfileName}]-{src}
# Reads models/data_aci_l3out_redistribute_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_452 = yamldecode(file("${path.module}/../models/data_aci_l3out_redistribute_policy.yml"))["data_aci_l3out_redistribute_policy"]
}

data "aci_l3out_redistribute_policy" "n452" {
  parent_dn                  = local.m_452["parent_dn"]
  route_control_profile_name = local.m_452["route_control_profile_name"]
  source                     = local.m_452["source"]
}

output "n452_data_aci_l3out_redistribute_policy_id" {
  value = data.aci_l3out_redistribute_policy.n452.id
}
