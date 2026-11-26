# 138 · data source aci_cdp_interface_policy · 2. Access policies
# Data source for ACI CDP Interface Policy
# APIC class: cdpIfPol · DN: uni/infra/cdpIfP-{name}
# Reads models/data_aci_cdp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_138 = yamldecode(file("${path.module}/../models/data_aci_cdp_interface_policy.yml"))["data_aci_cdp_interface_policy"]
}

data "aci_cdp_interface_policy" "n138" {
  name = local.m_138["name"]
}

output "n138_data_aci_cdp_interface_policy_id" {
  value = data.aci_cdp_interface_policy.n138.id
}
