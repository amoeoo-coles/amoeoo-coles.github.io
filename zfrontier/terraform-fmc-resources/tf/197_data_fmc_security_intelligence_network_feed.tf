# 197 · data source fmc_security_intelligence_network_feed · 2. Objects
# This data source reads the Security Intelligence Network Feed.
# Reads models/data_fmc_security_intelligence_network_feed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_197 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_network_feed.yml"))["data_fmc_security_intelligence_network_feed"]
}

data "fmc_security_intelligence_network_feed" "n197" {
  domain = local.m_197["domain"]
  id     = local.m_197["id"]
  name   = local.m_197["name"]
}

output "n197_data_fmc_security_intelligence_network_feed_id" {
  value = data.fmc_security_intelligence_network_feed.n197.id
}
