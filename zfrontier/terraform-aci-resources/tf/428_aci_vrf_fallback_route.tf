# 428 · resource aci_vrf_fallback_route · 3. Tenant and networking
# Manages ACI VRF Fallback Route
# APIC class: fvFBRoute · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}/pfx-[{fbrPrefix}]
# Reads models/aci_vrf_fallback_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_428 = yamldecode(file("${path.module}/../models/aci_vrf_fallback_route.yml"))["aci_vrf_fallback_route"]
}

resource "aci_vrf_fallback_route" "n428" {
  annotation     = local.m_428["annotation"]
  annotations    = local.m_428["annotations"]
  description    = local.m_428["description"]
  name           = local.m_428["name"]
  name_alias     = local.m_428["name_alias"]
  parent_dn      = local.m_428["parent_dn"]
  prefix_address = local.m_428["prefix_address"]
  tags           = local.m_428["tags"]
}
