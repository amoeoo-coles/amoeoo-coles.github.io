# 453 · resource aci_logical_node_profile · 3. Tenant and networking
# Manages ACI Logical Node Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_logical_node_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_453 = yamldecode(file("${path.module}/../models/aci_logical_node_profile.yml"))["aci_logical_node_profile"]
}

resource "aci_logical_node_profile" "n453" {
  annotation    = local.m_453["annotation"]
  config_issues = local.m_453["config_issues"]
  description   = local.m_453["description"]
  l3_outside_dn = local.m_453["l3_outside_dn"]
  name          = local.m_453["name"]
  name_alias    = local.m_453["name_alias"]
  tag           = local.m_453["tag"]
  target_dscp   = local.m_453["target_dscp"]
}
