# 513 · data source aci_endpoint_security_group_epg_selector · 4. Application
# Data source for ACI Endpoint Security Group EPG Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_security_group_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_513 = yamldecode(file("${path.module}/../models/data_aci_endpoint_security_group_epg_selector.yml"))["data_aci_endpoint_security_group_epg_selector"]
}

data "aci_endpoint_security_group_epg_selector" "n513" {
  annotation                 = local.m_513["annotation"]
  description                = local.m_513["description"]
  endpoint_security_group_dn = local.m_513["endpoint_security_group_dn"]
  match_epg_dn               = local.m_513["match_epg_dn"]
  name_alias                 = local.m_513["name_alias"]
}

output "n513_data_aci_endpoint_security_group_epg_selector_id" {
  value = data.aci_endpoint_security_group_epg_selector.n513.id
}
