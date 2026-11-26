# 252 · data source aci_spine_port_policy_group · 2. Access policies
# Data source for ACI Spine Port Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_port_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_252 = yamldecode(file("${path.module}/../models/data_aci_spine_port_policy_group.yml"))["data_aci_spine_port_policy_group"]
}

data "aci_spine_port_policy_group" "n252" {
  annotation  = local.m_252["annotation"]
  description = local.m_252["description"]
  name        = local.m_252["name"]
  name_alias  = local.m_252["name_alias"]
}

output "n252_data_aci_spine_port_policy_group_id" {
  value = data.aci_spine_port_policy_group.n252.id
}
