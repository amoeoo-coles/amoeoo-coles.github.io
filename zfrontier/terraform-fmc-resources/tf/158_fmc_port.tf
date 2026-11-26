# 158 · resource fmc_port · 2. Objects
# This resource manages a Port.
# Reads models/fmc_port.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_158 = yamldecode(file("${path.module}/../models/fmc_port.yml"))["fmc_port"]
}

resource "fmc_port" "n158" {
  description = local.m_158["description"]
  domain = local.m_158["domain"]
  name = local.m_158["name"]
  overridable = local.m_158["overridable"]
  port = local.m_158["port"]
  protocol = local.m_158["protocol"]
}
