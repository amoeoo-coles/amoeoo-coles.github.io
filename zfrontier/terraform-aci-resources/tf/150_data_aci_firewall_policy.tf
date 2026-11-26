# 150 · data source aci_firewall_policy · 2. Access policies
# Data source for ACI Firewall Policy
# APIC class: nwsFwPol · DN: uni/infra/fwP-{name}
# Reads models/data_aci_firewall_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_150 = yamldecode(file("${path.module}/../models/data_aci_firewall_policy.yml"))["data_aci_firewall_policy"]
}

data "aci_firewall_policy" "n150" {
  name = local.m_150["name"]
}

output "n150_data_aci_firewall_policy_id" {
  value = data.aci_firewall_policy.n150.id
}
