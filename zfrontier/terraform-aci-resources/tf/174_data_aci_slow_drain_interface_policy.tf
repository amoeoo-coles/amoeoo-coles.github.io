# 174 · data source aci_slow_drain_interface_policy · 2. Access policies
# Data source for ACI Slow Drain Interface Policy
# APIC class: qosSdIfPol · DN: uni/infra/qossdpol-{name}
# Reads models/data_aci_slow_drain_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_174 = yamldecode(file("${path.module}/../models/data_aci_slow_drain_interface_policy.yml"))["data_aci_slow_drain_interface_policy"]
}

data "aci_slow_drain_interface_policy" "n174" {
  name = local.m_174["name"]
}

output "n174_data_aci_slow_drain_interface_policy_id" {
  value = data.aci_slow_drain_interface_policy.n174.id
}
