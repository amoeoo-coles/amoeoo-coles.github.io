# 331 · resource sdwan_activate_topology_group · 9. Configuration, policy and topology groups
# This resource can activate a topology group. Only one topology group can be active at a time. To switch the active group, change the id attribute on the existing resource in place instead of replacing the resource (destroy + create); an in-place change issues a single activation that supersedes th
# Reads models/sdwan_activate_topology_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_331 = yamldecode(file("${path.module}/../models/sdwan_activate_topology_group.yml"))["sdwan_activate_topology_group"]
}

resource "sdwan_activate_topology_group" "n331" {
  feature_versions = local.m_331["feature_versions"]
  id               = local.m_331["id"]
}
