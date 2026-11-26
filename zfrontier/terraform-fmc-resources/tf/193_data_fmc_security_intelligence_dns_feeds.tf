# 193 · data source fmc_security_intelligence_dns_feeds · 2. Objects
# This data source reads the Security Intelligence DNS Feeds.
# Reads models/data_fmc_security_intelligence_dns_feeds.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_193 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_dns_feeds.yml"))["data_fmc_security_intelligence_dns_feeds"]
}

data "fmc_security_intelligence_dns_feeds" "n193" {
  domain = local.m_193["domain"]
  items  = local.m_193["items"]
}

output "n193_data_fmc_security_intelligence_dns_feeds_id" {
  value = data.fmc_security_intelligence_dns_feeds.n193.id
}
