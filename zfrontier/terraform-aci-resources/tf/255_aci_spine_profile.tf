# 255 · resource aci_spine_profile · 2. Access policies
# Manages ACI Spine Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_255 = yamldecode(file("${path.module}/../models/aci_spine_profile.yml"))["aci_spine_profile"]
}

resource "aci_spine_profile" "n255" {
  annotation                      = local.m_255["annotation"]
  description                     = local.m_255["description"]
  name                            = local.m_255["name"]
  name_alias                      = local.m_255["name_alias"]
  node_block_ids                  = local.m_255["node_block_ids"]
  relation_infra_rs_sp_acc_port_p = local.m_255["relation_infra_rs_sp_acc_port_p"]
  spine_selector_ids              = local.m_255["spine_selector_ids"]
  dynamic "spine_selector" {
    for_each = local.m_255["spine_selector"] == null ? [] : local.m_255["spine_selector"]
    content {
      description             = lookup(spine_selector.value, "description", null)
      name                    = lookup(spine_selector.value, "name", null)
      switch_association_type = lookup(spine_selector.value, "switch_association_type", null)
      dynamic "node_block" {
        for_each = lookup(spine_selector.value, "node_block", null) == null ? [] : spine_selector.value["node_block"]
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
