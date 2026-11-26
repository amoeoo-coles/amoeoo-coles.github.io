# 154 · resource fmc_policy_list · 2. Objects
# This resource manages a Policy List.
# Reads models/fmc_policy_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_154 = yamldecode(file("${path.module}/../models/fmc_policy_list.yml"))["fmc_policy_list"]
}

resource "fmc_policy_list" "n154" {
  action                             = local.m_154["action"]
  address_ipv4_prefix_lists          = local.m_154["address_ipv4_prefix_lists"]
  address_standard_access_lists      = local.m_154["address_standard_access_lists"]
  as_paths                           = local.m_154["as_paths"]
  community_lists                    = local.m_154["community_lists"]
  domain                             = local.m_154["domain"]
  extended_community_lists           = local.m_154["extended_community_lists"]
  interface_names                    = local.m_154["interface_names"]
  interfaces                         = local.m_154["interfaces"]
  match_community_exactly            = local.m_154["match_community_exactly"]
  metric                             = local.m_154["metric"]
  name                               = local.m_154["name"]
  next_hop_ipv4_prefix_lists         = local.m_154["next_hop_ipv4_prefix_lists"]
  next_hop_standard_access_lists     = local.m_154["next_hop_standard_access_lists"]
  route_source_ipv4_prefix_lists     = local.m_154["route_source_ipv4_prefix_lists"]
  route_source_standard_access_lists = local.m_154["route_source_standard_access_lists"]
  tag                                = local.m_154["tag"]
}
