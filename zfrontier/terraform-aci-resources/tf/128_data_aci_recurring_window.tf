# 128 · data source aci_recurring_window · 1. System and fabric setup
# Data source for ACI Recurring Window
# APIC class: not collected · DN: not collected
# Reads models/data_aci_recurring_window.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_128 = yamldecode(file("${path.module}/../models/data_aci_recurring_window.yml"))["data_aci_recurring_window"]
}

data "aci_recurring_window" "n128" {
  annotation        = local.m_128["annotation"]
  concur_cap        = local.m_128["concur_cap"]
  day               = local.m_128["day"]
  hour              = local.m_128["hour"]
  minute            = local.m_128["minute"]
  name              = local.m_128["name"]
  name_alias        = local.m_128["name_alias"]
  node_upg_interval = local.m_128["node_upg_interval"]
  proc_break        = local.m_128["proc_break"]
  proc_cap          = local.m_128["proc_cap"]
  scheduler_dn      = local.m_128["scheduler_dn"]
  time_cap          = local.m_128["time_cap"]
}

output "n128_data_aci_recurring_window_id" {
  value = data.aci_recurring_window.n128.id
}
