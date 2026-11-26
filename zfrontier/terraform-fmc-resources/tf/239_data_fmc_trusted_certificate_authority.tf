# 239 · data source fmc_trusted_certificate_authority · 2. Objects
# This data source reads the Trusted Certificate Authority. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_trusted_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_239 = yamldecode(file("${path.module}/../models/data_fmc_trusted_certificate_authority.yml"))["data_fmc_trusted_certificate_authority"]
}

data "fmc_trusted_certificate_authority" "n239" {
  domain = local.m_239["domain"]
  id     = local.m_239["id"]
  name   = local.m_239["name"]
}

output "n239_data_fmc_trusted_certificate_authority_id" {
  value = data.fmc_trusted_certificate_authority.n239.id
}
