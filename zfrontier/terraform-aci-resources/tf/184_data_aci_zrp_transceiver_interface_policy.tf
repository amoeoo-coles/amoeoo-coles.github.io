# 184 · data source aci_zrp_transceiver_interface_policy · 2. Access policies
# Data source for ACI ZRP (ZR+) Transceiver Interface Policy
# APIC class: xcvrZRPIfPol · DN: uni/infra/zrp-{name}
# Reads models/data_aci_zrp_transceiver_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_184 = yamldecode(file("${path.module}/../models/data_aci_zrp_transceiver_interface_policy.yml"))["data_aci_zrp_transceiver_interface_policy"]
}

data "aci_zrp_transceiver_interface_policy" "n184" {
  name = local.m_184["name"]
}

output "n184_data_aci_zrp_transceiver_interface_policy_id" {
  value = data.aci_zrp_transceiver_interface_policy.n184.id
}
