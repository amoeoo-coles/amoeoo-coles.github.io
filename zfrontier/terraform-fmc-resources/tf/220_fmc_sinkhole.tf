# 220 · resource fmc_sinkhole · 2. Objects
# This resource manages a Sinkhole. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 10.0
# Reads models/fmc_sinkhole.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_220 = yamldecode(file("${path.module}/../models/fmc_sinkhole.yml"))["fmc_sinkhole"]
}

resource "fmc_sinkhole" "n220" {
  action = local.m_220["action"]
  domain = local.m_220["domain"]
  ipv4_address = local.m_220["ipv4_address"]
  ipv6_address = local.m_220["ipv6_address"]
  log_connection_type = local.m_220["log_connection_type"]
  name = local.m_220["name"]
}
