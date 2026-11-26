# 201 · data source fmc_security_intelligence_network_lists · 2. Objects
# This data source reads the Security Intelligence Network Lists.
# Reads models/data_fmc_security_intelligence_network_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_201 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_network_lists.yml"))["data_fmc_security_intelligence_network_lists"]
}

data "fmc_security_intelligence_network_lists" "n201" {
  domain = local.m_201["domain"]
  items = local.m_201["items"]
}

output "n201_data_fmc_security_intelligence_network_lists_id" {
  value = data.fmc_security_intelligence_network_lists.n201.id
}
