# 304 · data source aci_bgp_route_summarization · 3. Tenant and networking
# Data source for ACI BGP Route Summarization
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_route_summarization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_304 = yamldecode(file("${path.module}/../models/data_aci_bgp_route_summarization.yml"))["data_aci_bgp_route_summarization"]
}

data "aci_bgp_route_summarization" "n304" {
  address_type_controls = local.m_304["address_type_controls"]
  annotation            = local.m_304["annotation"]
  attrmap               = local.m_304["attrmap"]
  ctrl                  = local.m_304["ctrl"]
  description           = local.m_304["description"]
  name                  = local.m_304["name"]
  name_alias            = local.m_304["name_alias"]
  tenant_dn             = local.m_304["tenant_dn"]
}

output "n304_data_aci_bgp_route_summarization_id" {
  value = data.aci_bgp_route_summarization.n304.id
}
