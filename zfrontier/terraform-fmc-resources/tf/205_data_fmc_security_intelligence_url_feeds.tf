# 205 · data source fmc_security_intelligence_url_feeds · 2. Objects
# This data source reads the Security Intelligence URL Feeds.
# Reads models/data_fmc_security_intelligence_url_feeds.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_205 = yamldecode(file("${path.module}/../models/data_fmc_security_intelligence_url_feeds.yml"))["data_fmc_security_intelligence_url_feeds"]
}

data "fmc_security_intelligence_url_feeds" "n205" {
  domain = local.m_205["domain"]
  items = local.m_205["items"]
}

output "n205_data_fmc_security_intelligence_url_feeds_id" {
  value = data.fmc_security_intelligence_url_feeds.n205.id
}
