# 450 · data source fmc_realms · 6. Integrations
# This data source reads the Realms, including built-in ones like Special Identities.
# Reads models/data_fmc_realms.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_450 = yamldecode(file("${path.module}/../models/data_fmc_realms.yml"))["data_fmc_realms"]
}

data "fmc_realms" "n450" {
  domain = local.m_450["domain"]
  items  = local.m_450["items"]
}

output "n450_data_fmc_realms_id" {
  value = data.fmc_realms.n450.id
}
