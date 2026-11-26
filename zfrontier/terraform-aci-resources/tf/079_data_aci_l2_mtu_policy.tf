# 079 · data source aci_l2_mtu_policy · 1. System and fabric setup
# Data source for ACI L2 MTU Policy
# APIC class: l2InstPol · DN: uni/fabric/l2pol-{name}
# Reads models/data_aci_l2_mtu_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_079 = yamldecode(file("${path.module}/../models/data_aci_l2_mtu_policy.yml"))["data_aci_l2_mtu_policy"]
}

data "aci_l2_mtu_policy" "n079" {
  name = local.m_079["name"]
}

output "n079_data_aci_l2_mtu_policy_id" {
  value = data.aci_l2_mtu_policy.n079.id
}
