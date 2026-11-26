# 574 · resource aci_contract_subject · 4. Application
# Manages ACI Contract Subject
# APIC class: not collected · DN: not collected
# Reads models/aci_contract_subject.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_574 = yamldecode(file("${path.module}/../models/aci_contract_subject.yml"))["aci_contract_subject"]
}

resource "aci_contract_subject" "n574" {
  annotation                    = local.m_574["annotation"]
  apply_both_directions         = local.m_574["apply_both_directions"]
  cons_match_t                  = local.m_574["cons_match_t"]
  contract_dn                   = local.m_574["contract_dn"]
  description                   = local.m_574["description"]
  name                          = local.m_574["name"]
  name_alias                    = local.m_574["name_alias"]
  prio                          = local.m_574["prio"]
  prov_match_t                  = local.m_574["prov_match_t"]
  relation_vz_rs_sdwan_pol      = local.m_574["relation_vz_rs_sdwan_pol"]
  relation_vz_rs_subj_filt_att  = local.m_574["relation_vz_rs_subj_filt_att"]
  relation_vz_rs_subj_graph_att = local.m_574["relation_vz_rs_subj_graph_att"]
  rev_flt_ports                 = local.m_574["rev_flt_ports"]
  target_dscp                   = local.m_574["target_dscp"]
  dynamic "consumer_to_provider" {
    for_each = local.m_574["consumer_to_provider"] == null ? [] : local.m_574["consumer_to_provider"]
    content {
      prio                             = lookup(consumer_to_provider.value, "prio", null)
      relation_vz_rs_in_term_graph_att = lookup(consumer_to_provider.value, "relation_vz_rs_in_term_graph_att", null)
      target_dscp                      = lookup(consumer_to_provider.value, "target_dscp", null)
      dynamic "relation_vz_rs_filt_att" {
        for_each = lookup(consumer_to_provider.value, "relation_vz_rs_filt_att", null) == null ? [] : consumer_to_provider.value["relation_vz_rs_filt_att"]
        content {
          action            = lookup(relation_vz_rs_filt_att.value, "action", null)
          directives        = lookup(relation_vz_rs_filt_att.value, "directives", null)
          filter_dn         = lookup(relation_vz_rs_filt_att.value, "filter_dn", null)
          priority_override = lookup(relation_vz_rs_filt_att.value, "priority_override", null)
        }
      }
    }
  }
  dynamic "provider_to_consumer" {
    for_each = local.m_574["provider_to_consumer"] == null ? [] : local.m_574["provider_to_consumer"]
    content {
      prio                              = lookup(provider_to_consumer.value, "prio", null)
      relation_vz_rs_out_term_graph_att = lookup(provider_to_consumer.value, "relation_vz_rs_out_term_graph_att", null)
      target_dscp                       = lookup(provider_to_consumer.value, "target_dscp", null)
      dynamic "relation_vz_rs_filt_att" {
        for_each = lookup(provider_to_consumer.value, "relation_vz_rs_filt_att", null) == null ? [] : provider_to_consumer.value["relation_vz_rs_filt_att"]
        content {
          action            = lookup(relation_vz_rs_filt_att.value, "action", null)
          directives        = lookup(relation_vz_rs_filt_att.value, "directives", null)
          filter_dn         = lookup(relation_vz_rs_filt_att.value, "filter_dn", null)
          priority_override = lookup(relation_vz_rs_filt_att.value, "priority_override", null)
        }
      }
    }
  }
}
