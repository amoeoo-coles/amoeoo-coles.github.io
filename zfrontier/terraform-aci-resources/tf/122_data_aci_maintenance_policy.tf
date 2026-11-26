# 122 · data source aci_maintenance_policy · 1. System and fabric setup
# Data source for ACI Maintenance Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_maintenance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_122 = yamldecode(file("${path.module}/../models/data_aci_maintenance_policy.yml"))["data_aci_maintenance_policy"]
}

data "aci_maintenance_policy" "n122" {
  admin_st               = local.m_122["admin_st"]
  annotation             = local.m_122["annotation"]
  description            = local.m_122["description"]
  graceful               = local.m_122["graceful"]
  ignore_compat          = local.m_122["ignore_compat"]
  internal_label         = local.m_122["internal_label"]
  name                   = local.m_122["name"]
  name_alias             = local.m_122["name_alias"]
  notif_cond             = local.m_122["notif_cond"]
  run_mode               = local.m_122["run_mode"]
  version                = local.m_122["version"]
  version_check_override = local.m_122["version_check_override"]
}

output "n122_data_aci_maintenance_policy_id" {
  value = data.aci_maintenance_policy.n122.id
}
