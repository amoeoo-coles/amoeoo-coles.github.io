# 238 · resource fmc_trusted_certificate_authority · 2. Objects
# This resource manages a Trusted Certificate Authority. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_trusted_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_238 = yamldecode(file("${path.module}/../models/fmc_trusted_certificate_authority.yml"))["fmc_trusted_certificate_authority"]
}

resource "fmc_trusted_certificate_authority" "n238" {
  certificate = local.m_238["certificate"]
  domain = local.m_238["domain"]
  name = local.m_238["name"]
}
