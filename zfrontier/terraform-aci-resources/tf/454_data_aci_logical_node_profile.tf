# 454 · data source aci_logical_node_profile · 3. Tenant and networking
# Data source for ACI Logical Node Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_logical_node_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_454 = yamldecode(file("${path.module}/../models/data_aci_logical_node_profile.yml"))["data_aci_logical_node_profile"]
}

data "aci_logical_node_profile" "n454" {
  annotation    = local.m_454["annotation"]
  config_issues = local.m_454["config_issues"]
  description   = local.m_454["description"]
  l3_outside_dn = local.m_454["l3_outside_dn"]
  name          = local.m_454["name"]
  name_alias    = local.m_454["name_alias"]
  tag           = local.m_454["tag"]
  target_dscp   = local.m_454["target_dscp"]
}

output "n454_data_aci_logical_node_profile_id" {
  value = data.aci_logical_node_profile.n454.id
}
