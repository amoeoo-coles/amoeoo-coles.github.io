# 397 · data source aci_relation_from_bridge_domain_to_netflow_monitor_policy · 3. Tenant and networking
# Data source for ACI Relation From Bridge Domain To NetFlow Monitor Policy
# APIC class: fvRsBDToNetflowMonitorPol · DN: uni/tn-{name}/BD-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType} | uni/tn-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType} | uni/tn-{name}/svcBD-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType}
# Reads models/data_aci_relation_from_bridge_domain_to_netflow_monitor_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_397 = yamldecode(file("${path.module}/../models/data_aci_relation_from_bridge_domain_to_netflow_monitor_policy.yml"))["data_aci_relation_from_bridge_domain_to_netflow_monitor_policy"]
}

data "aci_relation_from_bridge_domain_to_netflow_monitor_policy" "n397" {
  filter_type                 = local.m_397["filter_type"]
  netflow_monitor_policy_name = local.m_397["netflow_monitor_policy_name"]
  parent_dn                   = local.m_397["parent_dn"]
}

output "n397_data_aci_relation_from_bridge_domain_to_netflow_monitor_policy_id" {
  value = data.aci_relation_from_bridge_domain_to_netflow_monitor_policy.n397.id
}
