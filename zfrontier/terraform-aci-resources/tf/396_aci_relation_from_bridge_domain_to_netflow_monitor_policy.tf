# 396 · resource aci_relation_from_bridge_domain_to_netflow_monitor_policy · 3. Tenant and networking
# Manages ACI Relation From Bridge Domain To NetFlow Monitor Policy
# APIC class: fvRsBDToNetflowMonitorPol · DN: uni/tn-{name}/BD-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType} | uni/tn-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType} | uni/tn-{name}/svcBD-{name}/rsBDToNetflowMonitorPol-[{tnNetflowMonitorPolName}]-{fltType}
# Reads models/aci_relation_from_bridge_domain_to_netflow_monitor_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_396 = yamldecode(file("${path.module}/../models/aci_relation_from_bridge_domain_to_netflow_monitor_policy.yml"))["aci_relation_from_bridge_domain_to_netflow_monitor_policy"]
}

resource "aci_relation_from_bridge_domain_to_netflow_monitor_policy" "n396" {
  annotation                  = local.m_396["annotation"]
  annotations                 = local.m_396["annotations"]
  filter_type                 = local.m_396["filter_type"]
  netflow_monitor_policy_name = local.m_396["netflow_monitor_policy_name"]
  parent_dn                   = local.m_396["parent_dn"]
  tags                        = local.m_396["tags"]
}
