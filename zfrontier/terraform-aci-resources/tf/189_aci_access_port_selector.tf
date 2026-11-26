# 189 · resource aci_access_port_selector · 2. Access policies
# Manages ACI Access Port Selector
# APIC class: infraHPortS · DN: uni/infra/accportprof-{name}/hports-{name}-typ-{type} | uni/infra/fexprof-{name}/hports-{name}-typ-{type}
# Reads models/aci_access_port_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_189 = yamldecode(file("${path.module}/../models/aci_access_port_selector.yml"))["aci_access_port_selector"]
}

resource "aci_access_port_selector" "n189" {
  access_port_selector_type                 = local.m_189["access_port_selector_type"]
  annotation                                = local.m_189["annotation"]
  annotations                               = local.m_189["annotations"]
  description                               = local.m_189["description"]
  leaf_interface_profile_dn                 = local.m_189["leaf_interface_profile_dn"]
  name                                      = local.m_189["name"]
  name_alias                                = local.m_189["name_alias"]
  owner_key                                 = local.m_189["owner_key"]
  owner_tag                                 = local.m_189["owner_tag"]
  parent_dn                                 = local.m_189["parent_dn"]
  port_selector_type                        = local.m_189["port_selector_type"]
  relation_infra_rs_acc_base_grp            = local.m_189["relation_infra_rs_acc_base_grp"]
  relation_to_leaf_access_port_policy_group = local.m_189["relation_to_leaf_access_port_policy_group"]
  tags                                      = local.m_189["tags"]
}
