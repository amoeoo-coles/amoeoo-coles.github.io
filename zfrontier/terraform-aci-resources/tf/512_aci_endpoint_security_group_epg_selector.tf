# 512 · resource aci_endpoint_security_group_epg_selector · 4. Application
# Manages ACI Endpoint Security Group EPG Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_security_group_epg_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_512 = yamldecode(file("${path.module}/../models/aci_endpoint_security_group_epg_selector.yml"))["aci_endpoint_security_group_epg_selector"]
}

resource "aci_endpoint_security_group_epg_selector" "n512" {
  annotation                 = local.m_512["annotation"]
  description                = local.m_512["description"]
  endpoint_security_group_dn = local.m_512["endpoint_security_group_dn"]
  match_epg_dn               = local.m_512["match_epg_dn"]
  name                       = local.m_512["name"]
  name_alias                 = local.m_512["name_alias"]
}
