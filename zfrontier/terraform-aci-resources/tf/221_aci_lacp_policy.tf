# 221 · resource aci_lacp_policy · 2. Access policies
# Manages ACI LACP Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_lacp_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_221 = yamldecode(file("${path.module}/../models/aci_lacp_policy.yml"))["aci_lacp_policy"]
}

resource "aci_lacp_policy" "n221" {
  annotation  = local.m_221["annotation"]
  ctrl        = local.m_221["ctrl"]
  description = local.m_221["description"]
  max_links   = local.m_221["max_links"]
  min_links   = local.m_221["min_links"]
  mode        = local.m_221["mode"]
  name        = local.m_221["name"]
  name_alias  = local.m_221["name_alias"]
}
