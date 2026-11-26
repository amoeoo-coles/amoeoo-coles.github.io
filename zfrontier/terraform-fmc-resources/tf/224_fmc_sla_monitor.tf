# 224 · resource fmc_sla_monitor · 2. Objects
# This resource manages a SLA Monitor.
# Reads models/fmc_sla_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_224 = yamldecode(file("${path.module}/../models/fmc_sla_monitor.yml"))["fmc_sla_monitor"]
}

resource "fmc_sla_monitor" "n224" {
  data_size = local.m_224["data_size"]
  description = local.m_224["description"]
  domain = local.m_224["domain"]
  frequency = local.m_224["frequency"]
  monitor_address = local.m_224["monitor_address"]
  name = local.m_224["name"]
  number_of_packets = local.m_224["number_of_packets"]
  selected_interfaces = local.m_224["selected_interfaces"]
  sla_monitor_id = local.m_224["sla_monitor_id"]
  threshold = local.m_224["threshold"]
  timeout = local.m_224["timeout"]
  tos = local.m_224["tos"]
}
