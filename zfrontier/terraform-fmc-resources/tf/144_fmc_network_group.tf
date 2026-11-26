# 144 · resource fmc_network_group · 2. Objects
# This resource manages a Network Group.
# Reads models/fmc_network_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_144 = yamldecode(file("${path.module}/../models/fmc_network_group.yml"))["fmc_network_group"]
}

resource "fmc_network_group" "n144" {
  description = local.m_144["description"]
  domain = local.m_144["domain"]
  literals = local.m_144["literals"]
  name = local.m_144["name"]
  objects = local.m_144["objects"]
  overridable = local.m_144["overridable"]
}
