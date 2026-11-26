# 011 · resource aci_fabric_wide_settings · 1. System and fabric setup
# Manages ACI Fabric-Wide Settings Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_fabric_wide_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/aci_fabric_wide_settings.yml"))["aci_fabric_wide_settings"]
}

resource "aci_fabric_wide_settings" "n011" {
  annotation                        = local.m_011["annotation"]
  description                       = local.m_011["description"]
  disable_ep_dampening              = local.m_011["disable_ep_dampening"]
  domain_validation                 = local.m_011["domain_validation"]
  enable_mo_streaming               = local.m_011["enable_mo_streaming"]
  enable_remote_leaf_direct         = local.m_011["enable_remote_leaf_direct"]
  enforce_subnet_check              = local.m_011["enforce_subnet_check"]
  leaf_opflexp_authenticate_clients = local.m_011["leaf_opflexp_authenticate_clients"]
  leaf_opflexp_use_ssl              = local.m_011["leaf_opflexp_use_ssl"]
  name                              = local.m_011["name"]
  name_alias                        = local.m_011["name_alias"]
  opflexp_authenticate_clients      = local.m_011["opflexp_authenticate_clients"]
  opflexp_ssl_protocols             = local.m_011["opflexp_ssl_protocols"]
  opflexp_use_ssl                   = local.m_011["opflexp_use_ssl"]
  policy_sync_node_bringup          = local.m_011["policy_sync_node_bringup"]
  reallocate_gipo                   = local.m_011["reallocate_gipo"]
  restrict_infra_vlan_traffic       = local.m_011["restrict_infra_vlan_traffic"]
  unicast_xr_ep_learn_disable       = local.m_011["unicast_xr_ep_learn_disable"]
  validate_overlapping_vlans        = local.m_011["validate_overlapping_vlans"]
}
