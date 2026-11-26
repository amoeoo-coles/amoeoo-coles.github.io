# 227 · data source fmc_sla_monitors · 2. Objects
# This data source reads the SLA Monitors.
# Reads models/data_fmc_sla_monitors.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_227 = yamldecode(file("${path.module}/../models/data_fmc_sla_monitors.yml"))["data_fmc_sla_monitors"]
}

data "fmc_sla_monitors" "n227" {
  domain = local.m_227["domain"]
  items  = local.m_227["items"]
}

output "n227_data_fmc_sla_monitors_id" {
  value = data.fmc_sla_monitors.n227.id
}
