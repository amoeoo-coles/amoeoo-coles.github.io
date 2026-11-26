# 061 · resource fmc_external_certificate · 2. Objects
# This resource manages an External Certificate. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_external_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/fmc_external_certificate.yml"))["fmc_external_certificate"]
}

resource "fmc_external_certificate" "n061" {
  certificate = local.m_061["certificate"]
  domain      = local.m_061["domain"]
  name        = local.m_061["name"]
}
