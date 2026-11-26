# 126 · data source aci_pod_maintenance_group · 1. System and fabric setup
# Data source for ACI POD Maintenance Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_pod_maintenance_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_126 = yamldecode(file("${path.module}/../models/data_aci_pod_maintenance_group.yml"))["data_aci_pod_maintenance_group"]
}

data "aci_pod_maintenance_group" "n126" {
  annotation                 = local.m_126["annotation"]
  description                = local.m_126["description"]
  fwtype                     = local.m_126["fwtype"]
  name                       = local.m_126["name"]
  name_alias                 = local.m_126["name_alias"]
  pod_maintenance_group_type = local.m_126["pod_maintenance_group_type"]
}

output "n126_data_aci_pod_maintenance_group_id" {
  value = data.aci_pod_maintenance_group.n126.id
}
