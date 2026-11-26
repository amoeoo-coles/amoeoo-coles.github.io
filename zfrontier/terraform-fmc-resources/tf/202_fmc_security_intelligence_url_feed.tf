# 202 · resource fmc_security_intelligence_url_feed · 2. Objects
# This resource manages a Security Intelligence URL Feed. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_security_intelligence_url_feed.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_202 = yamldecode(file("${path.module}/../models/fmc_security_intelligence_url_feed.yml"))["fmc_security_intelligence_url_feed"]
}

resource "fmc_security_intelligence_url_feed" "n202" {
  checksum_url     = local.m_202["checksum_url"]
  domain           = local.m_202["domain"]
  feed_url         = local.m_202["feed_url"]
  name             = local.m_202["name"]
  update_frequency = local.m_202["update_frequency"]
}
