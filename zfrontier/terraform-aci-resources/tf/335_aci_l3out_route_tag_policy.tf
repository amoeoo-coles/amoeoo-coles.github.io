# 335 · resource aci_l3out_route_tag_policy · 3. Tenant and networking
# Manages ACI L3out Route Tag Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_route_tag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_335 = yamldecode(file("${path.module}/../models/aci_l3out_route_tag_policy.yml"))["aci_l3out_route_tag_policy"]
}

resource "aci_l3out_route_tag_policy" "n335" {
  annotation  = local.m_335["annotation"]
  description = local.m_335["description"]
  name        = local.m_335["name"]
  name_alias  = local.m_335["name_alias"]
  tag         = local.m_335["tag"]
  tenant_dn   = local.m_335["tenant_dn"]
}
