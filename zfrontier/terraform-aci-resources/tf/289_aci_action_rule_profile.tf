# 289 · resource aci_action_rule_profile · 3. Tenant and networking
# Manages ACI Action Rule Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_action_rule_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_289 = yamldecode(file("${path.module}/../models/aci_action_rule_profile.yml"))["aci_action_rule_profile"]
}

resource "aci_action_rule_profile" "n289" {
  annotation                  = local.m_289["annotation"]
  description                 = local.m_289["description"]
  multipath                   = local.m_289["multipath"]
  name                        = local.m_289["name"]
  name_alias                  = local.m_289["name_alias"]
  next_hop_propagation        = local.m_289["next_hop_propagation"]
  set_as_path_prepend_last_as = local.m_289["set_as_path_prepend_last_as"]
  set_communities             = local.m_289["set_communities"]
  set_dampening               = local.m_289["set_dampening"]
  set_metric                  = local.m_289["set_metric"]
  set_metric_type             = local.m_289["set_metric_type"]
  set_next_hop                = local.m_289["set_next_hop"]
  set_preference              = local.m_289["set_preference"]
  set_route_tag               = local.m_289["set_route_tag"]
  set_weight                  = local.m_289["set_weight"]
  tenant_dn                   = local.m_289["tenant_dn"]
  dynamic "set_as_path_prepend_as" {
    for_each = local.m_289["set_as_path_prepend_as"] == null ? [] : local.m_289["set_as_path_prepend_as"]
    content {
      asn   = lookup(set_as_path_prepend_as.value, "asn", null)
      order = lookup(set_as_path_prepend_as.value, "order", null)
    }
  }
}
