# 062 · data source fmc_external_certificate · 2. Objects
# This data source reads the External Certificate. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_external_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_062 = yamldecode(file("${path.module}/../models/data_fmc_external_certificate.yml"))["data_fmc_external_certificate"]
}

data "fmc_external_certificate" "n062" {
  domain = local.m_062["domain"]
  id     = local.m_062["id"]
  name   = local.m_062["name"]
}

output "n062_data_fmc_external_certificate_id" {
  value = data.fmc_external_certificate.n062.id
}
