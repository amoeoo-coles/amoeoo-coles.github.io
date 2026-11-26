# 232 · data source aci_leaf_profile · 2. Access policies
# Data source for ACI Leaf Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_leaf_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_232 = yamldecode(file("${path.module}/../models/data_aci_leaf_profile.yml"))["data_aci_leaf_profile"]
}

data "aci_leaf_profile" "n232" {
  annotation                   = local.m_232["annotation"]
  description                  = local.m_232["description"]
  leaf_selector_ids            = local.m_232["leaf_selector_ids"]
  name                         = local.m_232["name"]
  name_alias                   = local.m_232["name_alias"]
  node_block_ids               = local.m_232["node_block_ids"]
  relation_infra_rs_acc_card_p = local.m_232["relation_infra_rs_acc_card_p"]
  relation_infra_rs_acc_port_p = local.m_232["relation_infra_rs_acc_port_p"]
  dynamic "leaf_selector" {
    for_each = local.m_232["leaf_selector"] == null ? [] : local.m_232["leaf_selector"]
    content {
      description             = lookup(leaf_selector.value, "description", null)
      name                    = lookup(leaf_selector.value, "name", null)
      switch_association_type = lookup(leaf_selector.value, "switch_association_type", null)
      dynamic "node_block" {
        for_each = lookup(leaf_selector.value, "node_block", null) == null ? [] : leaf_selector.value["node_block"]
        content {
          description = lookup(node_block.value, "description", null)
          from_       = lookup(node_block.value, "from_", null)
          name        = lookup(node_block.value, "name", null)
          to_         = lookup(node_block.value, "to_", null)
        }
      }
    }
  }
}

output "n232_data_aci_leaf_profile_id" {
  value = data.aci_leaf_profile.n232.id
}
