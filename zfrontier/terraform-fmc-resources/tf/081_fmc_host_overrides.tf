# 081 · resource fmc_host_overrides · 2. Objects
# This resource manages a Host Overrides.
# Reads models/fmc_host_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/fmc_host_overrides.yml"))["fmc_host_overrides"]
}

resource "fmc_host_overrides" "n081" {
  domain      = local.m_081["domain"]
  overrides   = local.m_081["overrides"]
  parent_id   = local.m_081["parent_id"]
  parent_name = local.m_081["parent_name"]
}
