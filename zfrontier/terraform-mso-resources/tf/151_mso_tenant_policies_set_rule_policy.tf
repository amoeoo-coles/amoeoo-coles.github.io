# 151 · resource mso_tenant_policies_set_rule_policy · 10. Tenant policy templates
# Manages Set Rule Policies on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_set_rule_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_151 = yamldecode(file("${path.module}/../models/mso_tenant_policies_set_rule_policy.yml"))["mso_tenant_policies_set_rule_policy"]
}

resource "mso_tenant_policies_set_rule_policy" "n151" {
  description              = local.m_151["description"]
  name                     = local.m_151["name"]
  set_additional_community = local.m_151["set_additional_community"]
  set_metric               = local.m_151["set_metric"]
  set_metric_type          = local.m_151["set_metric_type"]
  set_multi_path           = local.m_151["set_multi_path"]
  set_next_hop             = local.m_151["set_next_hop"]
  set_next_hop_propagate   = local.m_151["set_next_hop_propagate"]
  template_id              = local.m_151["template_id"]
  dynamic "set_as_path" {
    for_each = local.m_151["set_as_path"] == null ? [] : local.m_151["set_as_path"]
    content {
      dynamic "prepend" {
        for_each = lookup(set_as_path.value, "prepend", null) == null ? [] : set_as_path.value["prepend"]
        content {
          dynamic "path_asn" {
            for_each = lookup(prepend.value, "path_asn", null) == null ? [] : prepend.value["path_asn"]
            content {
              asn   = lookup(path_asn.value, "asn", null)
              order = lookup(path_asn.value, "order", null)
            }
          }
        }
      }
      dynamic "prepend_last_as" {
        for_each = lookup(set_as_path.value, "prepend_last_as", null) == null ? [] : set_as_path.value["prepend_last_as"]
        content {
          asn_count = lookup(prepend_last_as.value, "asn_count", null)
        }
      }
    }
  }
  dynamic "set_community" {
    for_each = local.m_151["set_community"] == null ? [] : local.m_151["set_community"]
    content {
      community = lookup(set_community.value, "community", null)
      criteria  = lookup(set_community.value, "criteria", null)
    }
  }
  dynamic "set_dampening" {
    for_each = local.m_151["set_dampening"] == null ? [] : local.m_151["set_dampening"]
    content {
      half_life         = lookup(set_dampening.value, "half_life", null)
      max_suppress_time = lookup(set_dampening.value, "max_suppress_time", null)
      reuse_limit       = lookup(set_dampening.value, "reuse_limit", null)
      suppress_limit    = lookup(set_dampening.value, "suppress_limit", null)
    }
  }
  dynamic "set_preference" {
    for_each = local.m_151["set_preference"] == null ? [] : local.m_151["set_preference"]
    content {
      value = lookup(set_preference.value, "value", null)
    }
  }
  dynamic "set_route_tag" {
    for_each = local.m_151["set_route_tag"] == null ? [] : local.m_151["set_route_tag"]
    content {
      value = lookup(set_route_tag.value, "value", null)
    }
  }
  dynamic "set_weight" {
    for_each = local.m_151["set_weight"] == null ? [] : local.m_151["set_weight"]
    content {
      value = lookup(set_weight.value, "value", null)
    }
  }
}
