# 121 · resource aci_maintenance_policy · 1. System and fabric setup
# Manages ACI Maintenance Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_maintenance_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_121 = yamldecode(file("${path.module}/../models/aci_maintenance_policy.yml"))["aci_maintenance_policy"]
}

resource "aci_maintenance_policy" "n121" {
  admin_st                        = local.m_121["admin_st"]
  annotation                      = local.m_121["annotation"]
  description                     = local.m_121["description"]
  graceful                        = local.m_121["graceful"]
  ignore_compat                   = local.m_121["ignore_compat"]
  internal_label                  = local.m_121["internal_label"]
  name                            = local.m_121["name"]
  name_alias                      = local.m_121["name_alias"]
  notif_cond                      = local.m_121["notif_cond"]
  relation_maint_rs_pol_notif     = local.m_121["relation_maint_rs_pol_notif"]
  relation_maint_rs_pol_scheduler = local.m_121["relation_maint_rs_pol_scheduler"]
  relation_trig_rs_triggerable    = local.m_121["relation_trig_rs_triggerable"]
  run_mode                        = local.m_121["run_mode"]
  version                         = local.m_121["version"]
  version_check_override          = local.m_121["version_check_override"]
}
