# 290 · data source aci_action_rule_profile · 3. Tenant and networking
# Data source for the ACI Action Rule Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_action_rule_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_290 = yamldecode(file("${path.module}/../models/data_aci_action_rule_profile.yml"))["data_aci_action_rule_profile"]
}

data "aci_action_rule_profile" "n290" {
  annotation                  = local.m_290["annotation"]
  description                 = local.m_290["description"]
  multipath                   = local.m_290["multipath"]
  name                        = local.m_290["name"]
  name_alias                  = local.m_290["name_alias"]
  next_hop_propagation        = local.m_290["next_hop_propagation"]
  set_as_path_prepend_last_as = local.m_290["set_as_path_prepend_last_as"]
  set_communities             = local.m_290["set_communities"]
  set_dampening               = local.m_290["set_dampening"]
  set_metric                  = local.m_290["set_metric"]
  set_metric_type             = local.m_290["set_metric_type"]
  set_next_hop                = local.m_290["set_next_hop"]
  set_preference              = local.m_290["set_preference"]
  set_route_tag               = local.m_290["set_route_tag"]
  set_weight                  = local.m_290["set_weight"]
  tenant_dn                   = local.m_290["tenant_dn"]
  dynamic "set_as_path_prepend_as" {
    for_each = local.m_290["set_as_path_prepend_as"] == null ? [] : local.m_290["set_as_path_prepend_as"]
    content {
      asn   = lookup(set_as_path_prepend_as.value, "asn", null)
      order = lookup(set_as_path_prepend_as.value, "order", null)
    }
  }
}

output "n290_data_aci_action_rule_profile_id" {
  value = data.aci_action_rule_profile.n290.id
}
