# 082 · resource aci_fabric_node_control · 1. System and fabric setup
# Manages ACI Fabric Node Control
# APIC class: not collected · DN: not collected
# Reads models/aci_fabric_node_control.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/aci_fabric_node_control.yml"))["aci_fabric_node_control"]
}

resource "aci_fabric_node_control" "n082" {
  annotation  = local.m_082["annotation"]
  control     = local.m_082["control"]
  description = local.m_082["description"]
  feature_sel = local.m_082["feature_sel"]
  name        = local.m_082["name"]
  name_alias  = local.m_082["name_alias"]
}
