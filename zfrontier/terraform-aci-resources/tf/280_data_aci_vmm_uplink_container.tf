# 280 · data source aci_vmm_uplink_container · 2. Access policies
# Data source for ACI VMM Uplink Container
# APIC class: vmmUplinkPCont · DN: uni/vmmp-{vendor}/dom-{name}/uplinkpcont
# Reads models/data_aci_vmm_uplink_container.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_280 = yamldecode(file("${path.module}/../models/data_aci_vmm_uplink_container.yml"))["data_aci_vmm_uplink_container"]
}

data "aci_vmm_uplink_container" "n280" {
  parent_dn = local.m_280["parent_dn"]
}

output "n280_data_aci_vmm_uplink_container_id" {
  value = data.aci_vmm_uplink_container.n280.id
}
