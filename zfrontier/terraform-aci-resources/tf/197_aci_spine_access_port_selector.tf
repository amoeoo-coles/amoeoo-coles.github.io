# 197 · resource aci_spine_access_port_selector · 2. Access policies
# Manages ACI Spine Access Port Selector
# APIC class: infraSHPortS · DN: uni/infra/spaccportprof-{name}/shports-{name}-typ-{type}
# Reads models/aci_spine_access_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_197 = yamldecode(file("${path.module}/../models/aci_spine_access_port_selector.yml"))["aci_spine_access_port_selector"]
}

resource "aci_spine_access_port_selector" "n197" {
  annotation                          = local.m_197["annotation"]
  annotations                         = local.m_197["annotations"]
  description                         = local.m_197["description"]
  name                                = local.m_197["name"]
  name_alias                          = local.m_197["name_alias"]
  owner_key                           = local.m_197["owner_key"]
  owner_tag                           = local.m_197["owner_tag"]
  parent_dn                           = local.m_197["parent_dn"]
  port_selector_type                  = local.m_197["port_selector_type"]
  relation_infra_rs_sp_acc_grp        = local.m_197["relation_infra_rs_sp_acc_grp"]
  relation_to_spine_port_policy_group = local.m_197["relation_to_spine_port_policy_group"]
  spine_access_port_selector_type     = local.m_197["spine_access_port_selector_type"]
  spine_interface_profile_dn          = local.m_197["spine_interface_profile_dn"]
  tags                                = local.m_197["tags"]
}
