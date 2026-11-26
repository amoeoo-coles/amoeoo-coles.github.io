# 192 · data source fmc_security_intelligence_dns_feed · 2. Objects
# This data source reads the Security Intelligence DNS Feed.
# Reads models/data_fmc_security_intelligence_dns_feed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_192 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_dns_feed.yml"))["data_fmc_security_intelligence_dns_feed"]
}

data "fmc_security_intelligence_dns_feed" "n192" {
  domain = local.m_192["domain"]
  id     = local.m_192["id"]
  name   = local.m_192["name"]
}

output "n192_data_fmc_security_intelligence_dns_feed_id" {
  value = data.fmc_security_intelligence_dns_feed.n192.id
}
