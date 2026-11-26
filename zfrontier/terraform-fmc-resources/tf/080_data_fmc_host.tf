# 080 · data source fmc_host · 2. Objects
# This data source reads the Host.
# Reads models/data_fmc_host.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_080 = yamldecode(file("${path.module}/../models/data_fmc_host.yml"))["data_fmc_host"]
}

data "fmc_host" "n080" {
  domain = local.m_080["domain"]
  id     = local.m_080["id"]
  name   = local.m_080["name"]
}

output "n080_data_fmc_host_id" {
  value = data.fmc_host.n080.id
}
