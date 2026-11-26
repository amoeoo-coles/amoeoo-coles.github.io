# 353 · resource aci_ospf_route_summarization · 3. Tenant and networking
# Manages ACI OSPF Route Summarization
# APIC class: not collected · DN: not collected
# Reads models/aci_ospf_route_summarization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_353 = yamldecode(file("${path.module}/../models/aci_ospf_route_summarization.yml"))["aci_ospf_route_summarization"]
}

resource "aci_ospf_route_summarization" "n353" {
  annotation         = local.m_353["annotation"]
  cost               = local.m_353["cost"]
  description        = local.m_353["description"]
  inter_area_enabled = local.m_353["inter_area_enabled"]
  name               = local.m_353["name"]
  name_alias         = local.m_353["name_alias"]
  tag                = local.m_353["tag"]
  tenant_dn          = local.m_353["tenant_dn"]
}
