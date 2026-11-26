# 115 · resource fmc_internal_certificate_authority · 2. Objects
# This resource manages an Internal Certificate Authority.
# Reads models/fmc_internal_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/fmc_internal_certificate_authority.yml"))["fmc_internal_certificate_authority"]
}

resource "fmc_internal_certificate_authority" "n115" {
  certificate = local.m_115["certificate"]
  domain      = local.m_115["domain"]
  name        = local.m_115["name"]
  password    = local.m_115["password"]
  private_key = try(var.secrets["fmc_internal_certificate_authority.private_key"], local.m_115["private_key"])
}
