# 114 · resource catalystcenter_anycast_gateways · 7. SD-Access
# Manages Anycast Gateways within a single resource, specifying a list of anycast gateways as input
# Reads models/catalystcenter_anycast_gateways.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/catalystcenter_anycast_gateways.yml"))["catalystcenter_anycast_gateways"]
}

resource "catalystcenter_anycast_gateways" "n114" {
  anycast_gateways = local.m_114["anycast_gateways"]
  fabric_id = local.m_114["fabric_id"]
}
