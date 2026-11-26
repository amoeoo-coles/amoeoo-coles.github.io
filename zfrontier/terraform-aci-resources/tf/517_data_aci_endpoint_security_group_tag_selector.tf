# 517 · data source aci_endpoint_security_group_tag_selector · 4. Application
# Data source for ACI Endpoint Security Group Tag Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_security_group_tag_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_517 = yamldecode(file("${path.module}/../models/data_aci_endpoint_security_group_tag_selector.yml"))["data_aci_endpoint_security_group_tag_selector"]
}

data "aci_endpoint_security_group_tag_selector" "n517" {
  annotation                 = local.m_517["annotation"]
  description                = local.m_517["description"]
  endpoint_security_group_dn = local.m_517["endpoint_security_group_dn"]
  match_key                  = local.m_517["match_key"]
  match_value                = local.m_517["match_value"]
  name_alias                 = local.m_517["name_alias"]
  value_operator             = local.m_517["value_operator"]
}

output "n517_data_aci_endpoint_security_group_tag_selector_id" {
  value = data.aci_endpoint_security_group_tag_selector.n517.id
}
