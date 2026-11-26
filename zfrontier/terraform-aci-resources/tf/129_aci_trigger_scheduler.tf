# 129 · resource aci_trigger_scheduler · 1. System and fabric setup
# Manages ACI Trigger Scheduler
# APIC class: not collected · DN: not collected
# Reads models/aci_trigger_scheduler.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_129 = yamldecode(file("${path.module}/../models/aci_trigger_scheduler.yml"))["aci_trigger_scheduler"]
}

resource "aci_trigger_scheduler" "n129" {
  annotation  = local.m_129["annotation"]
  description = local.m_129["description"]
  name        = local.m_129["name"]
  name_alias  = local.m_129["name_alias"]
}
