# 133 · data source fmc_ise_sgts · 2. Objects
# This data source reads ISE Security Group Tags (SGTs).
# Reads models/data_fmc_ise_sgts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_133 = yamldecode(file("${path.module}/../models/data_fmc_ise_sgts.yml"))["data_fmc_ise_sgts"]
}

data "fmc_ise_sgts" "n133" {
  domain = local.m_133["domain"]
  items = local.m_133["items"]
}

output "n133_data_fmc_ise_sgts_id" {
  value = data.fmc_ise_sgts.n133.id
}
