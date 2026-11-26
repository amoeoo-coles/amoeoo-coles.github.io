# 200 · data source fmc_security_intelligence_network_list · 2. Objects
# This data source reads the Security Intelligence Network List.
# Reads models/data_fmc_security_intelligence_network_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_200 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_network_list.yml"))["data_fmc_security_intelligence_network_list"]
}

data "fmc_security_intelligence_network_list" "n200" {
  domain = local.m_200["domain"]
  id = local.m_200["id"]
  name = local.m_200["name"]
}

output "n200_data_fmc_security_intelligence_network_list_id" {
  value = data.fmc_security_intelligence_network_list.n200.id
}
