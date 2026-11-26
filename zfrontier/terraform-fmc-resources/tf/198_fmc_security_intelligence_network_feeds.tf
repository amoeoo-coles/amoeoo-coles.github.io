# 198 · resource fmc_security_intelligence_network_feeds · 2. Objects
# This resource manages Security Intelligence Network Feeds through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4Bulk object creation is not supported by FMC, it will be 
# Reads models/fmc_security_intelligence_network_feeds.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_198 = yamldecode(file("${path.module}/../models/fmc_security_intelligence_network_feeds.yml"))["fmc_security_intelligence_network_feeds"]
}

resource "fmc_security_intelligence_network_feeds" "n198" {
  domain = local.m_198["domain"]
  items = local.m_198["items"]
}
