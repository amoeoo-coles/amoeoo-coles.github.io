# 575 · data source aci_contract_subject · 4. Application
# Data source for ACI Contract Subject
# APIC class: not collected · DN: not collected
# Reads models/data_aci_contract_subject.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_575 = yamldecode(file("${path.module}/../models/data_aci_contract_subject.yml"))["data_aci_contract_subject"]
}

data "aci_contract_subject" "n575" {
  annotation            = local.m_575["annotation"]
  apply_both_directions = local.m_575["apply_both_directions"]
  cons_match_t          = local.m_575["cons_match_t"]
  contract_dn           = local.m_575["contract_dn"]
  description           = local.m_575["description"]
  name                  = local.m_575["name"]
  name_alias            = local.m_575["name_alias"]
  prio                  = local.m_575["prio"]
  prov_match_t          = local.m_575["prov_match_t"]
  rev_flt_ports         = local.m_575["rev_flt_ports"]
  target_dscp           = local.m_575["target_dscp"]
  dynamic "consumer_to_provider" {
    for_each = local.m_575["consumer_to_provider"] == null ? [] : local.m_575["consumer_to_provider"]
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
    for_each = local.m_575["provider_to_consumer"] == null ? [] : local.m_575["provider_to_consumer"]
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

output "n575_data_aci_contract_subject_id" {
  value = data.aci_contract_subject.n575.id
}
