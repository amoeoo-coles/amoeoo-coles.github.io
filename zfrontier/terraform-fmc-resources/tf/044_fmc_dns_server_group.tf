# 044 · resource fmc_dns_server_group · 2. Objects
# This resource manages a DNS Server Group. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_dns_server_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/fmc_dns_server_group.yml"))["fmc_dns_server_group"]
}

resource "fmc_dns_server_group" "n044" {
  default_domain = local.m_044["default_domain"]
  dns_servers = local.m_044["dns_servers"]
  domain = local.m_044["domain"]
  name = local.m_044["name"]
  retries = local.m_044["retries"]
  timeout = local.m_044["timeout"]
}
