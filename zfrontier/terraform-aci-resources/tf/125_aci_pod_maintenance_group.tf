# 125 · resource aci_pod_maintenance_group · 1. System and fabric setup
# Manages ACI POD Maintenance Group
# APIC class: not collected · DN: not collected
# Reads models/aci_pod_maintenance_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_125 = yamldecode(file("${path.module}/../models/aci_pod_maintenance_group.yml"))["aci_pod_maintenance_group"]
}

resource "aci_pod_maintenance_group" "n125" {
  annotation                 = local.m_125["annotation"]
  description                = local.m_125["description"]
  fwtype                     = local.m_125["fwtype"]
  name                       = local.m_125["name"]
  name_alias                 = local.m_125["name_alias"]
  pod_maintenance_group_type = local.m_125["pod_maintenance_group_type"]
  relation_maint_rs_mgrpp    = local.m_125["relation_maint_rs_mgrpp"]
}
