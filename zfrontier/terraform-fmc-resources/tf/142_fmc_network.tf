# 142 · resource fmc_network · 2. Objects
# This resource manages a Network.
# Reads models/fmc_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_142 = yamldecode(file("${path.module}/../models/fmc_network.yml"))["fmc_network"]
}

resource "fmc_network" "n142" {
  description = local.m_142["description"]
  domain = local.m_142["domain"]
  name = local.m_142["name"]
  overridable = local.m_142["overridable"]
  prefix = local.m_142["prefix"]
}
