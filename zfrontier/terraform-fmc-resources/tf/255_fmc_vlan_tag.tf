# 255 · resource fmc_vlan_tag · 2. Objects
# This resource manages a VLAN Tag.
# Reads models/fmc_vlan_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_255 = yamldecode(file("${path.module}/../models/fmc_vlan_tag.yml"))["fmc_vlan_tag"]
}

resource "fmc_vlan_tag" "n255" {
  description = local.m_255["description"]
  domain = local.m_255["domain"]
  end_tag = local.m_255["end_tag"]
  name = local.m_255["name"]
  overridable = local.m_255["overridable"]
  start_tag = local.m_255["start_tag"]
}
