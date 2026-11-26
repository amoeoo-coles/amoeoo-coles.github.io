# 451 · resource aci_l3out_redistribute_policy · 3. Tenant and networking
# Manages ACI L3Out Redistribute Policy
# APIC class: l3extRsRedistributePol · DN: uni/tn-{name}/out-{name}/rsredistributePol-[{tnRtctrlProfileName}]-{src}
# Reads models/aci_l3out_redistribute_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_451 = yamldecode(file("${path.module}/../models/aci_l3out_redistribute_policy.yml"))["aci_l3out_redistribute_policy"]
}

resource "aci_l3out_redistribute_policy" "n451" {
  annotation                 = local.m_451["annotation"]
  annotations                = local.m_451["annotations"]
  parent_dn                  = local.m_451["parent_dn"]
  route_control_profile_name = local.m_451["route_control_profile_name"]
  source                     = local.m_451["source"]
  tags                       = local.m_451["tags"]
}
