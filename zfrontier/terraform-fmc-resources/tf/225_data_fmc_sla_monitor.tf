# 225 · data source fmc_sla_monitor · 2. Objects
# This data source reads the SLA Monitor.
# Reads models/data_fmc_sla_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_225 = yamldecode(file("${path.module}/../models/data_fmc_sla_monitor.yml"))["data_fmc_sla_monitor"]
}

data "fmc_sla_monitor" "n225" {
  domain = local.m_225["domain"]
  id = local.m_225["id"]
  name = local.m_225["name"]
}

output "n225_data_fmc_sla_monitor_id" {
  value = data.fmc_sla_monitor.n225.id
}
