# 182 · data source aci_zr_transceiver_interface_policy · 2. Access policies
# Data source for ACI ZR Transceiver Interface Policy
# APIC class: xcvrZRIfPol · DN: uni/infra/zr-{name}
# Reads models/data_aci_zr_transceiver_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_182 = yamldecode(file("${path.module}/../models/data_aci_zr_transceiver_interface_policy.yml"))["data_aci_zr_transceiver_interface_policy"]
}

data "aci_zr_transceiver_interface_policy" "n182" {
  name = local.m_182["name"]
}

output "n182_data_aci_zr_transceiver_interface_policy_id" {
  value = data.aci_zr_transceiver_interface_policy.n182.id
}
