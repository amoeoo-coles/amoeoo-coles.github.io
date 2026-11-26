# 098 · resource aci_managed_node_connectivity_group · 1. System and fabric setup
# Manages ACI Managed Node Connectivity Group
# APIC class: not collected · DN: not collected
# Reads models/aci_managed_node_connectivity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/aci_managed_node_connectivity_group.yml"))["aci_managed_node_connectivity_group"]
}

resource "aci_managed_node_connectivity_group" "n098" {
  annotation = local.m_098["annotation"]
  name       = local.m_098["name"]
}
