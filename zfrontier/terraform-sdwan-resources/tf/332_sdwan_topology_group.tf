# 332 · resource sdwan_topology_group · 9. Configuration, policy and topology groups
# This resource can manage a Topology Group . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_topology_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_332 = yamldecode(file("${path.module}/../models/sdwan_topology_group.yml"))["sdwan_topology_group"]
}

resource "sdwan_topology_group" "n332" {
  description = local.m_332["description"]
  feature_profile_ids = local.m_332["feature_profile_ids"]
  feature_versions = local.m_332["feature_versions"]
  name = local.m_332["name"]
  solution = local.m_332["solution"]
}
