# 046 · resource fmc_dns_server_groups · 2. Objects
# This resource manages DNS Server Groups through bulk operations. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4Bulk object creation is not supported by FMC, it will be handled one-by-one
# Reads models/fmc_dns_server_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/fmc_dns_server_groups.yml"))["fmc_dns_server_groups"]
}

resource "fmc_dns_server_groups" "n046" {
  domain = local.m_046["domain"]
  items = local.m_046["items"]
}
