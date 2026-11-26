# 109 · resource fmc_interface_group · 2. Objects
# This resource manages an Interface Group.
# Reads models/fmc_interface_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_109 = yamldecode(file("${path.module}/../models/fmc_interface_group.yml"))["fmc_interface_group"]
}

resource "fmc_interface_group" "n109" {
  domain         = local.m_109["domain"]
  interface_type = local.m_109["interface_type"]
  interfaces     = local.m_109["interfaces"]
  name           = local.m_109["name"]
}
