# 110 · data source aci_fabric_path_ep · 1. System and fabric setup
# Data source for ACI Fabric Path End point
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fabric_path_ep.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/data_aci_fabric_path_ep.yml"))["data_aci_fabric_path_ep"]
}

data "aci_fabric_path_ep" "n110" {
  annotation  = local.m_110["annotation"]
  description = local.m_110["description"]
  name        = local.m_110["name"]
  node_id     = local.m_110["node_id"]
  pod_id      = local.m_110["pod_id"]
  vpc         = local.m_110["vpc"]
}

output "n110_data_aci_fabric_path_ep_id" {
  value = data.aci_fabric_path_ep.n110.id
}
