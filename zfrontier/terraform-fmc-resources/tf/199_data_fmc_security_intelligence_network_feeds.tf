# 199 · data source fmc_security_intelligence_network_feeds · 2. Objects
# This data source reads the Security Intelligence Network Feeds.
# Reads models/data_fmc_security_intelligence_network_feeds.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_199 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_network_feeds.yml"))["data_fmc_security_intelligence_network_feeds"]
}

data "fmc_security_intelligence_network_feeds" "n199" {
  domain = local.m_199["domain"]
  items  = local.m_199["items"]
}

output "n199_data_fmc_security_intelligence_network_feeds_id" {
  value = data.fmc_security_intelligence_network_feeds.n199.id
}
