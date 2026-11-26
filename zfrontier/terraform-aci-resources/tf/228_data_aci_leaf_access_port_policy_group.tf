# 228 · data source aci_leaf_access_port_policy_group · 2. Access policies
# Data source for ACI Leaf Access Port Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_leaf_access_port_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_228 = yamldecode(file("${path.module}/../models/data_aci_leaf_access_port_policy_group.yml"))["data_aci_leaf_access_port_policy_group"]
}

data "aci_leaf_access_port_policy_group" "n228" {
  annotation  = local.m_228["annotation"]
  description = local.m_228["description"]
  name        = local.m_228["name"]
  name_alias  = local.m_228["name_alias"]
}

output "n228_data_aci_leaf_access_port_policy_group_id" {
  value = data.aci_leaf_access_port_policy_group.n228.id
}
