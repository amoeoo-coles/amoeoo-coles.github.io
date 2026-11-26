# 564 · resource aci_contract · 4. Application
# Manages ACI Contract
# APIC class: vzBrCP · DN: uni/tn-{name}/brc-{name}
# Reads models/aci_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_564 = yamldecode(file("${path.module}/../models/aci_contract.yml"))["aci_contract"]
}

resource "aci_contract" "n564" {
  annotation               = local.m_564["annotation"]
  description              = local.m_564["description"]
  filter_entry_ids         = local.m_564["filter_entry_ids"]
  filter_ids               = local.m_564["filter_ids"]
  name                     = local.m_564["name"]
  name_alias               = local.m_564["name_alias"]
  prio                     = local.m_564["prio"]
  relation_vz_rs_graph_att = local.m_564["relation_vz_rs_graph_att"]
  scope                    = local.m_564["scope"]
  target_dscp              = local.m_564["target_dscp"]
  tenant_dn                = local.m_564["tenant_dn"]
  dynamic "filter" {
    for_each = local.m_564["filter"] == null ? [] : local.m_564["filter"]
    content {
      annotation  = lookup(filter.value, "annotation", null)
      description = lookup(filter.value, "description", null)
      filter_name = lookup(filter.value, "filter_name", null)
      name_alias  = lookup(filter.value, "name_alias", null)
      dynamic "filter_entry" {
        for_each = lookup(filter.value, "filter_entry", null) == null ? [] : filter.value["filter_entry"]
        content {
          annotation        = lookup(filter_entry.value, "annotation", null)
          apply_to_frag     = lookup(filter_entry.value, "apply_to_frag", null)
          arp_opc           = lookup(filter_entry.value, "arp_opc", null)
          d_from_port       = lookup(filter_entry.value, "d_from_port", null)
          d_to_port         = lookup(filter_entry.value, "d_to_port", null)
          description       = lookup(filter_entry.value, "description", null)
          entry_annotation  = lookup(filter_entry.value, "entry_annotation", null)
          entry_description = lookup(filter_entry.value, "entry_description", null)
          entry_name_alias  = lookup(filter_entry.value, "entry_name_alias", null)
          ether_t           = lookup(filter_entry.value, "ether_t", null)
          filter_entry_name = lookup(filter_entry.value, "filter_entry_name", null)
          icmpv4_t          = lookup(filter_entry.value, "icmpv4_t", null)
          icmpv6_t          = lookup(filter_entry.value, "icmpv6_t", null)
          match_dscp        = lookup(filter_entry.value, "match_dscp", null)
          prot              = lookup(filter_entry.value, "prot", null)
          s_from_port       = lookup(filter_entry.value, "s_from_port", null)
          s_to_port         = lookup(filter_entry.value, "s_to_port", null)
          stateful          = lookup(filter_entry.value, "stateful", null)
          tcp_rules         = lookup(filter_entry.value, "tcp_rules", null)
        }
      }
    }
  }
}
