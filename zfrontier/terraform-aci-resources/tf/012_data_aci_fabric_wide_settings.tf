# 012 · data source aci_fabric_wide_settings · 1. System and fabric setup
# Data source for ACI Fabric-Wide Settings Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fabric_wide_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/data_aci_fabric_wide_settings.yml"))["data_aci_fabric_wide_settings"]
}

data "aci_fabric_wide_settings" "n012" {
  annotation                        = local.m_012["annotation"]
  description                       = local.m_012["description"]
  disable_ep_dampening              = local.m_012["disable_ep_dampening"]
  domain_validation                 = local.m_012["domain_validation"]
  enable_mo_streaming               = local.m_012["enable_mo_streaming"]
  enable_remote_leaf_direct         = local.m_012["enable_remote_leaf_direct"]
  enforce_subnet_check              = local.m_012["enforce_subnet_check"]
  leaf_opflexp_authenticate_clients = local.m_012["leaf_opflexp_authenticate_clients"]
  leaf_opflexp_use_ssl              = local.m_012["leaf_opflexp_use_ssl"]
  name                              = local.m_012["name"]
  name_alias                        = local.m_012["name_alias"]
  opflexp_authenticate_clients      = local.m_012["opflexp_authenticate_clients"]
  opflexp_ssl_protocols             = local.m_012["opflexp_ssl_protocols"]
  opflexp_use_ssl                   = local.m_012["opflexp_use_ssl"]
  policy_sync_node_bringup          = local.m_012["policy_sync_node_bringup"]
  reallocate_gipo                   = local.m_012["reallocate_gipo"]
  restrict_infra_vlan_traffic       = local.m_012["restrict_infra_vlan_traffic"]
  unicast_xr_ep_learn_disable       = local.m_012["unicast_xr_ep_learn_disable"]
  validate_overlapping_vlans        = local.m_012["validate_overlapping_vlans"]
}

output "n012_data_aci_fabric_wide_settings_id" {
  value = data.aci_fabric_wide_settings.n012.id
}
