# 348 · data source aci_netflow_monitor_policy · 3. Tenant and networking
# Data source for ACI NetFlow Monitor Policy
# APIC class: netflowMonitorPol · DN: uni/infra/monitorpol-{name} | uni/tn-{name}/monitorpol-{name}
# Reads models/data_aci_netflow_monitor_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_348 = yamldecode(file("${path.module}/../models/data_aci_netflow_monitor_policy.yml"))["data_aci_netflow_monitor_policy"]
}

data "aci_netflow_monitor_policy" "n348" {
  name      = local.m_348["name"]
  parent_dn = local.m_348["parent_dn"]
}

output "n348_data_aci_netflow_monitor_policy_id" {
  value = data.aci_netflow_monitor_policy.n348.id
}
