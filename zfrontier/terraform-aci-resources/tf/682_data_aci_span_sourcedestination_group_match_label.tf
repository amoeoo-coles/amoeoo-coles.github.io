# 682 · data source aci_span_sourcedestination_group_match_label · 7. Monitoring and BAU
# Data source for ACI SPAN Source-destination Group Match Label
# APIC class: not collected · DN: not collected
# Reads models/data_aci_span_sourcedestination_group_match_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_682 = yamldecode(file("${path.module}/../models/data_aci_span_sourcedestination_group_match_label.yml"))["data_aci_span_sourcedestination_group_match_label"]
}

data "aci_span_sourcedestination_group_match_label" "n682" {
  annotation           = local.m_682["annotation"]
  description          = local.m_682["description"]
  name                 = local.m_682["name"]
  name_alias           = local.m_682["name_alias"]
  span_source_group_dn = local.m_682["span_source_group_dn"]
  tag                  = local.m_682["tag"]
}

output "n682_data_aci_span_sourcedestination_group_match_label_id" {
  value = data.aci_span_sourcedestination_group_match_label.n682.id
}
