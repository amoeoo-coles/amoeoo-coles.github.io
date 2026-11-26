# 117 · resource catalystcenter_extranet_policy · 7. SD-Access
# This resource can manage an Extranet Policy.
# Reads models/catalystcenter_extranet_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_117 = yamldecode(file("${path.module}/../models/catalystcenter_extranet_policy.yml"))["catalystcenter_extranet_policy"]
}

resource "catalystcenter_extranet_policy" "n117" {
  extranet_policy_name = local.m_117["extranet_policy_name"]
  fabric_ids = local.m_117["fabric_ids"]
  provider_virtual_network_name = local.m_117["provider_virtual_network_name"]
  subscriber_virtual_network_names = local.m_117["subscriber_virtual_network_names"]
}
