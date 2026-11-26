# 024 · resource fmc_bfd_template · 2. Objects
# This resource manages a BFD Template. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_bfd_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/fmc_bfd_template.yml"))["fmc_bfd_template"]
}

resource "fmc_bfd_template" "n024" {
  authentication_key_id = local.m_024["authentication_key_id"]
  authentication_password = try(var.secrets["fmc_bfd_template.authentication_password"], local.m_024["authentication_password"])
  authentication_password_encryption = local.m_024["authentication_password_encryption"]
  authentication_type = local.m_024["authentication_type"]
  domain = local.m_024["domain"]
  echo = local.m_024["echo"]
  hop_type = local.m_024["hop_type"]
  interval_type = local.m_024["interval_type"]
  minimum_receive = local.m_024["minimum_receive"]
  minimum_transmit = local.m_024["minimum_transmit"]
  multiplier = local.m_024["multiplier"]
  name = local.m_024["name"]
}
