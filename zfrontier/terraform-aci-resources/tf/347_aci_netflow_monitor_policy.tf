# 347 · resource aci_netflow_monitor_policy · 3. Tenant and networking
# Manages ACI NetFlow Monitor Policy
# APIC class: netflowMonitorPol · DN: uni/infra/monitorpol-{name} | uni/tn-{name}/monitorpol-{name}
# Reads models/aci_netflow_monitor_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_347 = yamldecode(file("${path.module}/../models/aci_netflow_monitor_policy.yml"))["aci_netflow_monitor_policy"]
}

resource "aci_netflow_monitor_policy" "n347" {
  annotation                    = local.m_347["annotation"]
  annotations                   = local.m_347["annotations"]
  description                   = local.m_347["description"]
  name                          = local.m_347["name"]
  name_alias                    = local.m_347["name_alias"]
  owner_key                     = local.m_347["owner_key"]
  owner_tag                     = local.m_347["owner_tag"]
  parent_dn                     = local.m_347["parent_dn"]
  relation_to_netflow_exporters = local.m_347["relation_to_netflow_exporters"]
  relation_to_netflow_record    = local.m_347["relation_to_netflow_record"]
  tags                          = local.m_347["tags"]
}
