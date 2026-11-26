# 106 · data source aci_system · 1. System and fabric setup
# Data source for ACI System
# APIC class: topSystem · DN: topology/pod-{id}/node-{id}/sys
# Reads models/data_aci_system.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/data_aci_system.yml"))["data_aci_system"]
}

data "aci_system" "n106" {
  pod_id    = local.m_106["pod_id"]
  system_id = local.m_106["system_id"]
}

output "n106_data_aci_system_id" {
  value = data.aci_system.n106.id
}
