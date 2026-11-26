# 027 · data source fmc_bfd_templates · 2. Objects
# This data source reads the BFD Templates. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_bfd_templates.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/data_fmc_bfd_templates.yml"))["data_fmc_bfd_templates"]
}

data "fmc_bfd_templates" "n027" {
  domain = local.m_027["domain"]
  items  = local.m_027["items"]
}

output "n027_data_fmc_bfd_templates_id" {
  value = data.fmc_bfd_templates.n027.id
}
