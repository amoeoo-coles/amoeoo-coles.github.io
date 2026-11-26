# 257 · resource aci_spine_switch_association · 2. Access policies
# Manages ACI Spine Switch Association
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_switch_association.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_257 = yamldecode(file("${path.module}/../models/aci_spine_switch_association.yml"))["aci_spine_switch_association"]
}

resource "aci_spine_switch_association" "n257" {
  annotation                             = local.m_257["annotation"]
  description                            = local.m_257["description"]
  name                                   = local.m_257["name"]
  name_alias                             = local.m_257["name_alias"]
  relation_infra_rs_spine_acc_node_p_grp = local.m_257["relation_infra_rs_spine_acc_node_p_grp"]
  spine_profile_dn                       = local.m_257["spine_profile_dn"]
  spine_switch_association_type          = local.m_257["spine_switch_association_type"]
}
