# 119 · resource aci_maintenance_group_node · 1. System and fabric setup
# Manages ACI Maintenance Group Node
# APIC class: not collected · DN: not collected
# Reads models/aci_maintenance_group_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_119 = yamldecode(file("${path.module}/../models/aci_maintenance_group_node.yml"))["aci_maintenance_group_node"]
}

resource "aci_maintenance_group_node" "n119" {
  annotation               = local.m_119["annotation"]
  description              = local.m_119["description"]
  from_                    = local.m_119["from_"]
  name                     = local.m_119["name"]
  name_alias               = local.m_119["name_alias"]
  pod_maintenance_group_dn = local.m_119["pod_maintenance_group_dn"]
  to_                      = local.m_119["to_"]
}
