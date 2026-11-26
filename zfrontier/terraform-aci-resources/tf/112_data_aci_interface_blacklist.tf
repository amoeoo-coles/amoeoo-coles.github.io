# 112 · data source aci_interface_blacklist · 1. System and fabric setup
# Data source for ACI Out of Service Fabric Path
# APIC class: not collected · DN: not collected
# Reads models/data_aci_interface_blacklist.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/data_aci_interface_blacklist.yml"))["data_aci_interface_blacklist"]
}

data "aci_interface_blacklist" "n112" {
  annotation  = local.m_112["annotation"]
  description = local.m_112["description"]
  fex_id      = local.m_112["fex_id"]
  interface   = local.m_112["interface"]
  node_id     = local.m_112["node_id"]
  pod_id      = local.m_112["pod_id"]
}

output "n112_data_aci_interface_blacklist_id" {
  value = data.aci_interface_blacklist.n112.id
}
