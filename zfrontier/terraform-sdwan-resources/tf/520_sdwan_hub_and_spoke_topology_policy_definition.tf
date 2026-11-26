# 520 · resource sdwan_hub_and_spoke_topology_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Hub and Spoke Topology Policy Definition .
# Reads models/sdwan_hub_and_spoke_topology_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_520 = yamldecode(file("${path.module}/../models/sdwan_hub_and_spoke_topology_policy_definition.yml"))["sdwan_hub_and_spoke_topology_policy_definition"]
}

resource "sdwan_hub_and_spoke_topology_policy_definition" "n520" {
  description      = local.m_520["description"]
  name             = local.m_520["name"]
  topologies       = local.m_520["topologies"]
  vpn_list_id      = local.m_520["vpn_list_id"]
  vpn_list_version = local.m_520["vpn_list_version"]
}
