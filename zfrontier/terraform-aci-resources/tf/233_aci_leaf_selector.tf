# 233 · resource aci_leaf_selector · 2. Access policies
# Manages ACI Leaf Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_leaf_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_233 = yamldecode(file("${path.module}/../models/aci_leaf_selector.yml"))["aci_leaf_selector"]
}

resource "aci_leaf_selector" "n233" {
  annotation                       = local.m_233["annotation"]
  description                      = local.m_233["description"]
  leaf_profile_dn                  = local.m_233["leaf_profile_dn"]
  name                             = local.m_233["name"]
  name_alias                       = local.m_233["name_alias"]
  relation_infra_rs_acc_node_p_grp = local.m_233["relation_infra_rs_acc_node_p_grp"]
  switch_association_type          = local.m_233["switch_association_type"]
}
