# 279 · resource sdwan_service_multicast_feature · 7. Features: service
# This resource can manage a Service Multicast Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_multicast_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_279 = yamldecode(file("${path.module}/../models/sdwan_service_multicast_feature.yml"))["sdwan_service_multicast_feature"]
}

resource "sdwan_service_multicast_feature" "n279" {
  auto_rp_announces = local.m_279["auto_rp_announces"]
  auto_rp_discoveries = local.m_279["auto_rp_discoveries"]
  description = local.m_279["description"]
  enable_auto_rp = local.m_279["enable_auto_rp"]
  enable_auto_rp_variable = local.m_279["enable_auto_rp_variable"]
  feature_profile_id = local.m_279["feature_profile_id"]
  igmp_interfaces = local.m_279["igmp_interfaces"]
  local_replicator = local.m_279["local_replicator"]
  local_replicator_threshold = local.m_279["local_replicator_threshold"]
  local_replicator_threshold_variable = local.m_279["local_replicator_threshold_variable"]
  local_replicator_variable = local.m_279["local_replicator_variable"]
  msdp_connection_retry_interval = local.m_279["msdp_connection_retry_interval"]
  msdp_connection_retry_interval_variable = local.m_279["msdp_connection_retry_interval_variable"]
  msdp_groups = local.m_279["msdp_groups"]
  msdp_originator_id = local.m_279["msdp_originator_id"]
  msdp_originator_id_variable = local.m_279["msdp_originator_id_variable"]
  name = local.m_279["name"]
  pim_bsr_candidates = local.m_279["pim_bsr_candidates"]
  pim_bsr_rp_candidates = local.m_279["pim_bsr_rp_candidates"]
  pim_interfaces = local.m_279["pim_interfaces"]
  pim_source_specific_multicast_access_list = local.m_279["pim_source_specific_multicast_access_list"]
  pim_source_specific_multicast_access_list_variable = local.m_279["pim_source_specific_multicast_access_list_variable"]
  pim_source_specific_multicast_enable = local.m_279["pim_source_specific_multicast_enable"]
  pim_spt_threshold = local.m_279["pim_spt_threshold"]
  pim_spt_threshold_variable = local.m_279["pim_spt_threshold_variable"]
  spt_only = local.m_279["spt_only"]
  spt_only_variable = local.m_279["spt_only_variable"]
  static_rp_addresses = local.m_279["static_rp_addresses"]
}
