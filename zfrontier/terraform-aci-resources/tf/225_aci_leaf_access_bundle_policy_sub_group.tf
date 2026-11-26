# 225 · resource aci_leaf_access_bundle_policy_sub_group · 2. Access policies
# Manages ACI Override Policy Group
# APIC class: not collected · DN: not collected
# Reads models/aci_leaf_access_bundle_policy_sub_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_225 = yamldecode(file("${path.module}/../models/aci_leaf_access_bundle_policy_sub_group.yml"))["aci_leaf_access_bundle_policy_sub_group"]
}

resource "aci_leaf_access_bundle_policy_sub_group" "n225" {
  annotation                         = local.m_225["annotation"]
  description                        = local.m_225["description"]
  leaf_access_bundle_policy_group_dn = local.m_225["leaf_access_bundle_policy_group_dn"]
  name                               = local.m_225["name"]
  name_alias                         = local.m_225["name_alias"]
  port_channel_member                = local.m_225["port_channel_member"]
}
