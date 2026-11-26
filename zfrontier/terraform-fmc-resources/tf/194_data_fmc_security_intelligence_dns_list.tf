# 194 · data source fmc_security_intelligence_dns_list · 2. Objects
# This data source reads the Security Intelligence DNS List.
# Reads models/data_fmc_security_intelligence_dns_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_194 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_dns_list.yml"))["data_fmc_security_intelligence_dns_list"]
}

data "fmc_security_intelligence_dns_list" "n194" {
  domain = local.m_194["domain"]
  id = local.m_194["id"]
  name = local.m_194["name"]
}

output "n194_data_fmc_security_intelligence_dns_list_id" {
  value = data.fmc_security_intelligence_dns_list.n194.id
}
