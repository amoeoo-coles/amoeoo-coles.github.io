# 283 · resource aci_lacp_enhanced_lag_policy · 2. Access policies
# Manages ACI LACP Enhanced Lag Policy
# APIC class: lacpEnhancedLagPol · DN: uni/vmmp-{vendor}/dom-{name}/vswitchpolcont/enlacplagp-{name}
# Reads models/aci_lacp_enhanced_lag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_283 = yamldecode(file("${path.module}/../models/aci_lacp_enhanced_lag_policy.yml"))["aci_lacp_enhanced_lag_policy"]
}

resource "aci_lacp_enhanced_lag_policy" "n283" {
  annotation          = local.m_283["annotation"]
  annotations         = local.m_283["annotations"]
  load_balancing_mode = local.m_283["load_balancing_mode"]
  mode                = local.m_283["mode"]
  name                = local.m_283["name"]
  name_alias          = local.m_283["name_alias"]
  number_of_links     = local.m_283["number_of_links"]
  parent_dn           = local.m_283["parent_dn"]
  tags                = local.m_283["tags"]
}
