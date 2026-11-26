# 195 · data source fmc_security_intelligence_dns_lists · 2. Objects
# This data source reads the Security Intelligence DNS Lists.
# Reads models/data_fmc_security_intelligence_dns_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_195 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_dns_lists.yml"))["data_fmc_security_intelligence_dns_lists"]
}

data "fmc_security_intelligence_dns_lists" "n195" {
  domain = local.m_195["domain"]
  items  = local.m_195["items"]
}

output "n195_data_fmc_security_intelligence_dns_lists_id" {
  value = data.fmc_security_intelligence_dns_lists.n195.id
}
