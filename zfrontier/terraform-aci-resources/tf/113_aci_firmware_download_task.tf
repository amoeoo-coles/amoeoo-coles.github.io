# 113 · resource aci_firmware_download_task · 1. System and fabric setup
# Manages ACI Firmware Download Task
# APIC class: not collected · DN: not collected
# Reads models/aci_firmware_download_task.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/aci_firmware_download_task.yml"))["aci_firmware_download_task"]
}

resource "aci_firmware_download_task" "n113" {
  annotation                       = local.m_113["annotation"]
  auth_pass                        = local.m_113["auth_pass"]
  auth_type                        = local.m_113["auth_type"]
  description                      = local.m_113["description"]
  dnld_task_flip                   = local.m_113["dnld_task_flip"]
  identity_private_key_contents    = local.m_113["identity_private_key_contents"]
  identity_private_key_passphrase  = local.m_113["identity_private_key_passphrase"]
  identity_public_key_contents     = local.m_113["identity_public_key_contents"]
  load_catalog_if_exists_and_newer = local.m_113["load_catalog_if_exists_and_newer"]
  name                             = local.m_113["name"]
  name_alias                       = local.m_113["name_alias"]
  password                         = local.m_113["password"]
  polling_interval                 = local.m_113["polling_interval"]
  proto                            = local.m_113["proto"]
  url                              = local.m_113["url"]
  user                             = local.m_113["user"]
}
