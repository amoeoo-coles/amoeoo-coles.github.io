# 116 · data source aci_firmware_group · 1. System and fabric setup
# Data source for ACI Firmware Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_firmware_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/data_aci_firmware_group.yml"))["data_aci_firmware_group"]
}

data "aci_firmware_group" "n116" {
  annotation          = local.m_116["annotation"]
  description         = local.m_116["description"]
  firmware_group_type = local.m_116["firmware_group_type"]
  name                = local.m_116["name"]
  name_alias          = local.m_116["name_alias"]
}

output "n116_data_aci_firmware_group_id" {
  value = data.aci_firmware_group.n116.id
}
