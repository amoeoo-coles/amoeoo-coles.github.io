# 435 · resource aci_l3_outside · 3. Tenant and networking
# Manages ACI L3 Outside
# APIC class: not collected · DN: not collected
# Reads models/aci_l3_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_435 = yamldecode(file("${path.module}/../models/aci_l3_outside.yml"))["aci_l3_outside"]
}

resource "aci_l3_outside" "n435" {
  annotation                      = local.m_435["annotation"]
  description                     = local.m_435["description"]
  enforce_rtctrl                  = local.m_435["enforce_rtctrl"]
  mpls_enabled                    = local.m_435["mpls_enabled"]
  name                            = local.m_435["name"]
  name_alias                      = local.m_435["name_alias"]
  pim                             = local.m_435["pim"]
  relation_l3ext_rs_ectx          = local.m_435["relation_l3ext_rs_ectx"]
  relation_l3ext_rs_interleak_pol = local.m_435["relation_l3ext_rs_interleak_pol"]
  relation_l3ext_rs_l3_dom_att    = local.m_435["relation_l3ext_rs_l3_dom_att"]
  target_dscp                     = local.m_435["target_dscp"]
  tenant_dn                       = local.m_435["tenant_dn"]
  dynamic "default_route_leak_policy" {
    for_each = local.m_435["default_route_leak_policy"] == null ? [] : local.m_435["default_route_leak_policy"]
    content {
      always     = lookup(default_route_leak_policy.value, "always", null)
      annotation = lookup(default_route_leak_policy.value, "annotation", null)
      criteria   = lookup(default_route_leak_policy.value, "criteria", null)
      scope      = lookup(default_route_leak_policy.value, "scope", null)
    }
  }
  dynamic "relation_l3ext_rs_dampening_pol" {
    for_each = local.m_435["relation_l3ext_rs_dampening_pol"] == null ? [] : local.m_435["relation_l3ext_rs_dampening_pol"]
    content {
      af                     = lookup(relation_l3ext_rs_dampening_pol.value, "af", null)
      tn_rtctrl_profile_dn   = lookup(relation_l3ext_rs_dampening_pol.value, "tn_rtctrl_profile_dn", null)
      tn_rtctrl_profile_name = lookup(relation_l3ext_rs_dampening_pol.value, "tn_rtctrl_profile_name", null)
    }
  }
  dynamic "relation_l3extrs_redistribute_pol" {
    for_each = local.m_435["relation_l3extrs_redistribute_pol"] == null ? [] : local.m_435["relation_l3extrs_redistribute_pol"]
    content {
      source    = lookup(relation_l3extrs_redistribute_pol.value, "source", null)
      target_dn = lookup(relation_l3extrs_redistribute_pol.value, "target_dn", null)
    }
  }
}
