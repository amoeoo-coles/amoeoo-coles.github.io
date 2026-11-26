# 079 · resource fmc_host · 2. Objects
# This resource manages a Host.
# Reads models/fmc_host.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_079 = yamldecode(file("${path.module}/../models/fmc_host.yml"))["fmc_host"]
}

resource "fmc_host" "n079" {
  description = local.m_079["description"]
  domain      = local.m_079["domain"]
  ip          = local.m_079["ip"]
  name        = local.m_079["name"]
  overridable = local.m_079["overridable"]
}
