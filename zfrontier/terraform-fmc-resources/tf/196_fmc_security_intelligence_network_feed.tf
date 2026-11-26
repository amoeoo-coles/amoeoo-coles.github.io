# 196 · resource fmc_security_intelligence_network_feed · 2. Objects
# This resource manages a Security Intelligence Network Feed. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_security_intelligence_network_feed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_196 = yamldecode(file("${path.module}/../models/fmc_security_intelligence_network_feed.yml"))["fmc_security_intelligence_network_feed"]
}

resource "fmc_security_intelligence_network_feed" "n196" {
  checksum_url     = local.m_196["checksum_url"]
  domain           = local.m_196["domain"]
  feed_url         = local.m_196["feed_url"]
  name             = local.m_196["name"]
  update_frequency = local.m_196["update_frequency"]
}
