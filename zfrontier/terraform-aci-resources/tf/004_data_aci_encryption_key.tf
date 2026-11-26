# 004 · data source aci_encryption_key · 1. System and fabric setup
# Data source for ACI AES Encryption Passphrase and Keys for Config Export and Import
# APIC class: not collected · DN: not collected
# Reads models/data_aci_encryption_key.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_aci_encryption_key.yml"))["data_aci_encryption_key"]
}

data "aci_encryption_key" "n004" {
  annotation                        = local.m_004["annotation"]
  description                       = local.m_004["description"]
  name_alias                        = local.m_004["name_alias"]
  passphrase_key_derivation_version = local.m_004["passphrase_key_derivation_version"]
  strong_encryption_enabled         = local.m_004["strong_encryption_enabled"]
}

output "n004_data_aci_encryption_key_id" {
  value = data.aci_encryption_key.n004.id
}
