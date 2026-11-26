# 127 · resource aci_recurring_window · 1. System and fabric setup
# Manages ACI Recurring Window
# APIC class: not collected · DN: not collected
# Reads models/aci_recurring_window.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_127 = yamldecode(file("${path.module}/../models/aci_recurring_window.yml"))["aci_recurring_window"]
}

resource "aci_recurring_window" "n127" {
  annotation        = local.m_127["annotation"]
  concur_cap        = local.m_127["concur_cap"]
  day               = local.m_127["day"]
  hour              = local.m_127["hour"]
  minute            = local.m_127["minute"]
  name              = local.m_127["name"]
  name_alias        = local.m_127["name_alias"]
  node_upg_interval = local.m_127["node_upg_interval"]
  proc_break        = local.m_127["proc_break"]
  proc_cap          = local.m_127["proc_cap"]
  scheduler_dn      = local.m_127["scheduler_dn"]
  time_cap          = local.m_127["time_cap"]
}
