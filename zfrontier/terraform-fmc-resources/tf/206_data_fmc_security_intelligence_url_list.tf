# 206 · data source fmc_security_intelligence_url_list · 2. Objects
# This data source reads the Security Intelligence Url List.
# Reads models/data_fmc_security_intelligence_url_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_206 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_url_list.yml"))["data_fmc_security_intelligence_url_list"]
}

data "fmc_security_intelligence_url_list" "n206" {
  domain = local.m_206["domain"]
  id     = local.m_206["id"]
  name   = local.m_206["name"]
}

output "n206_data_fmc_security_intelligence_url_list_id" {
  value = data.fmc_security_intelligence_url_list.n206.id
}
