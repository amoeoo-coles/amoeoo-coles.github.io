# 020 · resource fmc_as_path · 2. Objects
# This resource manages an AS Path.
# Reads models/fmc_as_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/fmc_as_path.yml"))["fmc_as_path"]
}

resource "fmc_as_path" "n020" {
  domain      = local.m_020["domain"]
  entries     = local.m_020["entries"]
  name        = local.m_020["name"]
  overridable = local.m_020["overridable"]
}
