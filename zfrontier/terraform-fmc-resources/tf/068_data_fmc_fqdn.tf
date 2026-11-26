# 068 · data source fmc_fqdn · 2. Objects
# This data source reads the FQDN (Fully Qualified Domain Name) Object.
# Reads models/data_fmc_fqdn.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/data_fmc_fqdn.yml"))["data_fmc_fqdn"]
}

data "fmc_fqdn" "n068" {
  domain = local.m_068["domain"]
  id     = local.m_068["id"]
  name   = local.m_068["name"]
}

output "n068_data_fmc_fqdn_id" {
  value = data.fmc_fqdn.n068.id
}
