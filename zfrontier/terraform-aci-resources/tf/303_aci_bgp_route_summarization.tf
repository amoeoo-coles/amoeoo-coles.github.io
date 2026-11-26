# 303 · resource aci_bgp_route_summarization · 3. Tenant and networking
# Manages ACI BGP Route Summarization
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_route_summarization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_303 = yamldecode(file("${path.module}/../models/aci_bgp_route_summarization.yml"))["aci_bgp_route_summarization"]
}

resource "aci_bgp_route_summarization" "n303" {
  address_type_controls = local.m_303["address_type_controls"]
  annotation            = local.m_303["annotation"]
  attrmap               = local.m_303["attrmap"]
  ctrl                  = local.m_303["ctrl"]
  description           = local.m_303["description"]
  name                  = local.m_303["name"]
  name_alias            = local.m_303["name_alias"]
  tenant_dn             = local.m_303["tenant_dn"]
}
