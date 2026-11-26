# 354 · data source aci_ospf_route_summarization · 3. Tenant and networking
# Data source for ACI OSPF Route Summarization
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ospf_route_summarization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_354 = yamldecode(file("${path.module}/../models/data_aci_ospf_route_summarization.yml"))["data_aci_ospf_route_summarization"]
}

data "aci_ospf_route_summarization" "n354" {
  annotation         = local.m_354["annotation"]
  cost               = local.m_354["cost"]
  description        = local.m_354["description"]
  inter_area_enabled = local.m_354["inter_area_enabled"]
  name               = local.m_354["name"]
  name_alias         = local.m_354["name_alias"]
  tag                = local.m_354["tag"]
  tenant_dn          = local.m_354["tenant_dn"]
}

output "n354_data_aci_ospf_route_summarization_id" {
  value = data.aci_ospf_route_summarization.n354.id
}
