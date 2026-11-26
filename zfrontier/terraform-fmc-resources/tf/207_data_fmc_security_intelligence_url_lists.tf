# 207 · data source fmc_security_intelligence_url_lists · 2. Objects
# This data source reads the Security Intelligence Url Lists.
# Reads models/data_fmc_security_intelligence_url_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_207 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_url_lists.yml"))["data_fmc_security_intelligence_url_lists"]
}

data "fmc_security_intelligence_url_lists" "n207" {
  domain = local.m_207["domain"]
  items = local.m_207["items"]
}

output "n207_data_fmc_security_intelligence_url_lists_id" {
  value = data.fmc_security_intelligence_url_lists.n207.id
}
