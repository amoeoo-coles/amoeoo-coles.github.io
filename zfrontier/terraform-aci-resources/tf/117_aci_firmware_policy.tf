# 117 · resource aci_firmware_policy · 1. System and fabric setup
# Manages ACI Firmware Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_firmware_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_117 = yamldecode(file("${path.module}/../models/aci_firmware_policy.yml"))["aci_firmware_policy"]
}

resource "aci_firmware_policy" "n117" {
  annotation             = local.m_117["annotation"]
  description            = local.m_117["description"]
  effective_on_reboot    = local.m_117["effective_on_reboot"]
  ignore_compat          = local.m_117["ignore_compat"]
  internal_label         = local.m_117["internal_label"]
  name                   = local.m_117["name"]
  name_alias             = local.m_117["name_alias"]
  version                = local.m_117["version"]
  version_check_override = local.m_117["version_check_override"]
}
