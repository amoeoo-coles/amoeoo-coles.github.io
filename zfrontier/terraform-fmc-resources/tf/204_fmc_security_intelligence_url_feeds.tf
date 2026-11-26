# 204 · resource fmc_security_intelligence_url_feeds · 2. Objects
# This resource manages Security Intelligence URL Feeds through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4Bulk object creation is not supported by FMC, it will be hand
# Reads models/fmc_security_intelligence_url_feeds.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_204 = yamldecode(file("${path.module}/../models/fmc_security_intelligence_url_feeds.yml"))["fmc_security_intelligence_url_feeds"]
}

resource "fmc_security_intelligence_url_feeds" "n204" {
  domain = local.m_204["domain"]
  items  = local.m_204["items"]
}
