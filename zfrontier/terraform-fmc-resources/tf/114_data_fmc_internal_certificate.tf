# 114 · data source fmc_internal_certificate · 2. Objects
# This data source reads the Internal Certificate. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_internal_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/data_fmc_internal_certificate.yml"))["data_fmc_internal_certificate"]
}

data "fmc_internal_certificate" "n114" {
  domain = local.m_114["domain"]
  id = local.m_114["id"]
  name = local.m_114["name"]
}

output "n114_data_fmc_internal_certificate_id" {
  value = data.fmc_internal_certificate.n114.id
}
