# 226 · resource fmc_sla_monitors · 2. Objects
# This resource manages SLA Monitors through bulk operations. The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_sla_monitors.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_226 = yamldecode(file("${path.module}/../models/fmc_sla_monitors.yml"))["fmc_sla_monitors"]
}

resource "fmc_sla_monitors" "n226" {
  domain = local.m_226["domain"]
  items = local.m_226["items"]
}
