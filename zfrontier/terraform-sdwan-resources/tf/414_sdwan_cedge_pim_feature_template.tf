# 414 · resource sdwan_cedge_pim_feature_template · 11. (Classic) feature templates
# This resource can manage a cEdge PIM feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cedge_pim_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_414 = yamldecode(file("${path.module}/../models/sdwan_cedge_pim_feature_template.yml"))["sdwan_cedge_pim_feature_template"]
}

resource "sdwan_cedge_pim_feature_template" "n414" {
  auto_rp                           = local.m_414["auto_rp"]
  auto_rp_variable                  = local.m_414["auto_rp_variable"]
  bsr_candidate                     = local.m_414["bsr_candidate"]
  bsr_candidate_variable            = local.m_414["bsr_candidate_variable"]
  default                           = local.m_414["default"]
  default_variable                  = local.m_414["default_variable"]
  description                       = local.m_414["description"]
  device_types                      = local.m_414["device_types"]
  hash_mask_length                  = local.m_414["hash_mask_length"]
  hash_mask_length_variable         = local.m_414["hash_mask_length_variable"]
  interface_name                    = local.m_414["interface_name"]
  interface_name_variable           = local.m_414["interface_name_variable"]
  interfaces                        = local.m_414["interfaces"]
  name                              = local.m_414["name"]
  priority                          = local.m_414["priority"]
  priority_variable                 = local.m_414["priority_variable"]
  range                             = local.m_414["range"]
  range_variable                    = local.m_414["range_variable"]
  rp_addresses                      = local.m_414["rp_addresses"]
  rp_announce_fields                = local.m_414["rp_announce_fields"]
  rp_candidate_access_list          = local.m_414["rp_candidate_access_list"]
  rp_candidate_access_list_variable = local.m_414["rp_candidate_access_list_variable"]
  rp_candidates                     = local.m_414["rp_candidates"]
  scope                             = local.m_414["scope"]
  scope_variable                    = local.m_414["scope_variable"]
  spt_threshold                     = local.m_414["spt_threshold"]
  spt_threshold_variable            = local.m_414["spt_threshold_variable"]
}
