# 279 · resource aci_vmm_uplink_container · 2. Access policies
# Manages ACI VMM Uplink Container
# APIC class: vmmUplinkPCont · DN: uni/vmmp-{vendor}/dom-{name}/uplinkpcont
# Reads models/aci_vmm_uplink_container.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_279 = yamldecode(file("${path.module}/../models/aci_vmm_uplink_container.yml"))["aci_vmm_uplink_container"]
}

resource "aci_vmm_uplink_container" "n279" {
  annotation        = local.m_279["annotation"]
  annotations       = local.m_279["annotations"]
  name_alias        = local.m_279["name_alias"]
  number_of_uplinks = local.m_279["number_of_uplinks"]
  parent_dn         = local.m_279["parent_dn"]
  tags              = local.m_279["tags"]
  uplink_policies   = local.m_279["uplink_policies"]
}
