# 257 · resource fmc_vlan_tag_group · 2. Objects
# This resource manages a VLAN Tag Group.
# Reads models/fmc_vlan_tag_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_257 = yamldecode(file("${path.module}/../models/fmc_vlan_tag_group.yml"))["fmc_vlan_tag_group"]
}

resource "fmc_vlan_tag_group" "n257" {
  description = local.m_257["description"]
  domain = local.m_257["domain"]
  literals = local.m_257["literals"]
  name = local.m_257["name"]
  overridable = local.m_257["overridable"]
  vlan_tags = local.m_257["vlan_tags"]
}
