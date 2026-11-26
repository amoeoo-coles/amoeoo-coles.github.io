# 681 · resource aci_span_sourcedestination_group_match_label · 7. Monitoring and BAU
# Manages ACI SPAN Source-destination Group Match Label
# APIC class: not collected · DN: not collected
# Reads models/aci_span_sourcedestination_group_match_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_681 = yamldecode(file("${path.module}/../models/aci_span_sourcedestination_group_match_label.yml"))["aci_span_sourcedestination_group_match_label"]
}

resource "aci_span_sourcedestination_group_match_label" "n681" {
  annotation           = local.m_681["annotation"]
  description          = local.m_681["description"]
  name                 = local.m_681["name"]
  name_alias           = local.m_681["name_alias"]
  span_source_group_dn = local.m_681["span_source_group_dn"]
  tag                  = local.m_681["tag"]
}
