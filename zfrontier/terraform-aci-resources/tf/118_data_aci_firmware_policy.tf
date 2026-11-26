# 118 · data source aci_firmware_policy · 1. System and fabric setup
# Data source for ACI Firmware Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_firmware_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_118 = yamldecode(file("${path.module}/../models/data_aci_firmware_policy.yml"))["data_aci_firmware_policy"]
}

data "aci_firmware_policy" "n118" {
  annotation             = local.m_118["annotation"]
  description            = local.m_118["description"]
  effective_on_reboot    = local.m_118["effective_on_reboot"]
  ignore_compat          = local.m_118["ignore_compat"]
  internal_label         = local.m_118["internal_label"]
  name                   = local.m_118["name"]
  name_alias             = local.m_118["name_alias"]
  version                = local.m_118["version"]
  version_check_override = local.m_118["version_check_override"]
}

output "n118_data_aci_firmware_policy_id" {
  value = data.aci_firmware_policy.n118.id
}
