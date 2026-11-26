# 115 · resource aci_firmware_group · 1. System and fabric setup
# Manages ACI Firmware Group
# APIC class: not collected · DN: not collected
# Reads models/aci_firmware_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/aci_firmware_group.yml"))["aci_firmware_group"]
}

resource "aci_firmware_group" "n115" {
  annotation                  = local.m_115["annotation"]
  description                 = local.m_115["description"]
  firmware_group_type         = local.m_115["firmware_group_type"]
  name                        = local.m_115["name"]
  name_alias                  = local.m_115["name_alias"]
  relation_firmware_rs_fwgrpp = local.m_115["relation_firmware_rs_fwgrpp"]
}
