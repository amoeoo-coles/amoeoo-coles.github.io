# 226 · data source aci_leaf_access_bundle_policy_sub_group · 2. Access policies
# Data source for ACI Override Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_leaf_access_bundle_policy_sub_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_226 = yamldecode(file("${path.module}/../models/data_aci_leaf_access_bundle_policy_sub_group.yml"))["data_aci_leaf_access_bundle_policy_sub_group"]
}

data "aci_leaf_access_bundle_policy_sub_group" "n226" {
  annotation                         = local.m_226["annotation"]
  description                        = local.m_226["description"]
  leaf_access_bundle_policy_group_dn = local.m_226["leaf_access_bundle_policy_group_dn"]
  name                               = local.m_226["name"]
  name_alias                         = local.m_226["name_alias"]
  port_channel_member                = local.m_226["port_channel_member"]
}

output "n226_data_aci_leaf_access_bundle_policy_sub_group_id" {
  value = data.aci_leaf_access_bundle_policy_sub_group.n226.id
}
