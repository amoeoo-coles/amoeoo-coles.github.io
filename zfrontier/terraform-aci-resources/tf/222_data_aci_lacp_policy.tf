# 222 · data source aci_lacp_policy · 2. Access policies
# Data source for ACI LACP Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_lacp_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_222 = yamldecode(file("${path.module}/../models/data_aci_lacp_policy.yml"))["data_aci_lacp_policy"]
}

data "aci_lacp_policy" "n222" {
  annotation  = local.m_222["annotation"]
  ctrl        = local.m_222["ctrl"]
  description = local.m_222["description"]
  max_links   = local.m_222["max_links"]
  min_links   = local.m_222["min_links"]
  mode        = local.m_222["mode"]
  name        = local.m_222["name"]
  name_alias  = local.m_222["name_alias"]
}

output "n222_data_aci_lacp_policy_id" {
  value = data.aci_lacp_policy.n222.id
}
