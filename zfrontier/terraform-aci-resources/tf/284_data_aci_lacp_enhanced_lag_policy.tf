# 284 · data source aci_lacp_enhanced_lag_policy · 2. Access policies
# Data source for ACI LACP Enhanced Lag Policy
# APIC class: lacpEnhancedLagPol · DN: uni/vmmp-{vendor}/dom-{name}/vswitchpolcont/enlacplagp-{name}
# Reads models/data_aci_lacp_enhanced_lag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_284 = yamldecode(file("${path.module}/../models/data_aci_lacp_enhanced_lag_policy.yml"))["data_aci_lacp_enhanced_lag_policy"]
}

data "aci_lacp_enhanced_lag_policy" "n284" {
  name      = local.m_284["name"]
  parent_dn = local.m_284["parent_dn"]
}

output "n284_data_aci_lacp_enhanced_lag_policy_id" {
  value = data.aci_lacp_enhanced_lag_policy.n284.id
}
