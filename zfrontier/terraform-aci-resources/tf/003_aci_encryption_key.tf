# 003 · resource aci_encryption_key · 1. System and fabric setup
# Manages ACI AES Encryption Passphrase and Keys for Config Export and Import
# APIC class: not collected · DN: not collected
# Reads models/aci_encryption_key.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/aci_encryption_key.yml"))["aci_encryption_key"]
}

resource "aci_encryption_key" "n003" {
  annotation                        = local.m_003["annotation"]
  clear_encryption_key              = local.m_003["clear_encryption_key"]
  description                       = local.m_003["description"]
  name_alias                        = local.m_003["name_alias"]
  passphrase                        = local.m_003["passphrase"]
  passphrase_key_derivation_version = local.m_003["passphrase_key_derivation_version"]
  strong_encryption_enabled         = local.m_003["strong_encryption_enabled"]
}
