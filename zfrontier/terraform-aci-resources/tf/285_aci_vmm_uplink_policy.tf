# 285 · resource aci_vmm_uplink_policy · 2. Access policies
# Manages ACI VMM Uplink Policy
# APIC class: vmmUplinkP · DN: uni/vmmp-{vendor}/dom-{name}/uplinkpcont/uplinkp-{uplinkId}
# Reads models/aci_vmm_uplink_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_285 = yamldecode(file("${path.module}/../models/aci_vmm_uplink_policy.yml"))["aci_vmm_uplink_policy"]
}

resource "aci_vmm_uplink_policy" "n285" {
  annotation  = local.m_285["annotation"]
  annotations = local.m_285["annotations"]
  name_alias  = local.m_285["name_alias"]
  parent_dn   = local.m_285["parent_dn"]
  tags        = local.m_285["tags"]
  uplink_id   = local.m_285["uplink_id"]
  uplink_name = local.m_285["uplink_name"]
}
