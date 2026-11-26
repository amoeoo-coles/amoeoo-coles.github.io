# 160 · resource fmc_port_group · 2. Objects
# This resource manages a Port Group.
# Reads models/fmc_port_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_160 = yamldecode(file("${path.module}/../models/fmc_port_group.yml"))["fmc_port_group"]
}

resource "fmc_port_group" "n160" {
  description = local.m_160["description"]
  domain = local.m_160["domain"]
  name = local.m_160["name"]
  objects = local.m_160["objects"]
  overridable = local.m_160["overridable"]
}
