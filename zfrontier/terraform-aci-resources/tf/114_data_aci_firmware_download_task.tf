# 114 · data source aci_firmware_download_task · 1. System and fabric setup
# Data source for ACI Firmware Download Task
# APIC class: not collected · DN: not collected
# Reads models/data_aci_firmware_download_task.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/data_aci_firmware_download_task.yml"))["data_aci_firmware_download_task"]
}

data "aci_firmware_download_task" "n114" {
  annotation                       = local.m_114["annotation"]
  auth_pass                        = local.m_114["auth_pass"]
  auth_type                        = local.m_114["auth_type"]
  description                      = local.m_114["description"]
  dnld_task_flip                   = local.m_114["dnld_task_flip"]
  identity_private_key_contents    = local.m_114["identity_private_key_contents"]
  identity_private_key_passphrase  = local.m_114["identity_private_key_passphrase"]
  identity_public_key_contents     = local.m_114["identity_public_key_contents"]
  load_catalog_if_exists_and_newer = local.m_114["load_catalog_if_exists_and_newer"]
  name                             = local.m_114["name"]
  name_alias                       = local.m_114["name_alias"]
  password                         = local.m_114["password"]
  polling_interval                 = local.m_114["polling_interval"]
  proto                            = local.m_114["proto"]
  url                              = local.m_114["url"]
  user                             = local.m_114["user"]
}

output "n114_data_aci_firmware_download_task_id" {
  value = data.aci_firmware_download_task.n114.id
}
