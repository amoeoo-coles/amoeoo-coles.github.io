# 286 · data source aci_vmm_uplink_policy · 2. Access policies
# Data source for ACI VMM Uplink Policy
# APIC class: vmmUplinkP · DN: uni/vmmp-{vendor}/dom-{name}/uplinkpcont/uplinkp-{uplinkId}
# Reads models/data_aci_vmm_uplink_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_286 = yamldecode(file("${path.module}/../models/data_aci_vmm_uplink_policy.yml"))["data_aci_vmm_uplink_policy"]
}

data "aci_vmm_uplink_policy" "n286" {
  parent_dn = local.m_286["parent_dn"]
  uplink_id = local.m_286["uplink_id"]
}

output "n286_data_aci_vmm_uplink_policy_id" {
  value = data.aci_vmm_uplink_policy.n286.id
}
