# 025 · data source fmc_bfd_template · 2. Objects
# This data source reads the BFD Template. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_bfd_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/data_fmc_bfd_template.yml"))["data_fmc_bfd_template"]
}

data "fmc_bfd_template" "n025" {
  domain = local.m_025["domain"]
  id     = local.m_025["id"]
  name   = local.m_025["name"]
}

output "n025_data_fmc_bfd_template_id" {
  value = data.fmc_bfd_template.n025.id
}
