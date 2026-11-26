# 072 · data source fmc_fqdns · 2. Objects
# This data source reads the FQDN (Fully Qualified Domain Name) Object through bulk operations.
# Reads models/data_fmc_fqdns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_072 = yamldecode(file("${path.module}/../models/data_fmc_fqdns.yml"))["data_fmc_fqdns"]
}

data "fmc_fqdns" "n072" {
  domain = local.m_072["domain"]
  items  = local.m_072["items"]
}

output "n072_data_fmc_fqdns_id" {
  value = data.fmc_fqdns.n072.id
}
