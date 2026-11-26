# 130 · data source aci_trigger_scheduler · 1. System and fabric setup
# Data source for ACI Trigger Scheduler
# APIC class: not collected · DN: not collected
# Reads models/data_aci_trigger_scheduler.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_130 = yamldecode(file("${path.module}/../models/data_aci_trigger_scheduler.yml"))["data_aci_trigger_scheduler"]
}

data "aci_trigger_scheduler" "n130" {
  annotation  = local.m_130["annotation"]
  description = local.m_130["description"]
  name        = local.m_130["name"]
  name_alias  = local.m_130["name_alias"]
}

output "n130_data_aci_trigger_scheduler_id" {
  value = data.aci_trigger_scheduler.n130.id
}
