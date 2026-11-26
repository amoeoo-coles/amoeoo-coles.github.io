# 116 · data source fmc_internal_certificate_authority · 2. Objects
# This data source reads the Internal Certificate Authority.
# Reads models/data_fmc_internal_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/data_fmc_internal_certificate_authority.yml"))["data_fmc_internal_certificate_authority"]
}

data "fmc_internal_certificate_authority" "n116" {
  domain = local.m_116["domain"]
  id = local.m_116["id"]
  name = local.m_116["name"]
}

output "n116_data_fmc_internal_certificate_authority_id" {
  value = data.fmc_internal_certificate_authority.n116.id
}
