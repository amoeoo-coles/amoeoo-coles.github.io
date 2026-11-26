# 123 · resource sdwan_topology_feature_profile · 4. Feature profiles
# This resource can manage a Topology Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_topology_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_123 = yamldecode(file("${path.module}/../models/sdwan_topology_feature_profile.yml"))["sdwan_topology_feature_profile"]
}

resource "sdwan_topology_feature_profile" "n123" {
  description = local.m_123["description"]
  name = local.m_123["name"]
}
