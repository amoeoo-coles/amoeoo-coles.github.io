# 113 · resource fmc_internal_certificate · 2. Objects
# This resource manages an Internal Certificate. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_internal_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/fmc_internal_certificate.yml"))["fmc_internal_certificate"]
}

resource "fmc_internal_certificate" "n113" {
  certificate = local.m_113["certificate"]
  domain = local.m_113["domain"]
  name = local.m_113["name"]
  password = local.m_113["password"]
  private_key = try(var.secrets["fmc_internal_certificate.private_key"], local.m_113["private_key"])
}
