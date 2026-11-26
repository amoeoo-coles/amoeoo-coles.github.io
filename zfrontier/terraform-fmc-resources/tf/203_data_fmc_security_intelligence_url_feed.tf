# 203 · data source fmc_security_intelligence_url_feed · 2. Objects
# This data source reads the Security Intelligence URL Feed.
# Reads models/data_fmc_security_intelligence_url_feed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_203 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_url_feed.yml"))["data_fmc_security_intelligence_url_feed"]
}

data "fmc_security_intelligence_url_feed" "n203" {
  domain = local.m_203["domain"]
  id     = local.m_203["id"]
  name   = local.m_203["name"]
}

output "n203_data_fmc_security_intelligence_url_feed_id" {
  value = data.fmc_security_intelligence_url_feed.n203.id
}
