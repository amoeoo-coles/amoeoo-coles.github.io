# 267 · resource aci_vsan_pool · 2. Access policies
# Manages ACI VSAN Pool
# APIC class: not collected · DN: not collected
# Reads models/aci_vsan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_267 = yamldecode(file("${path.module}/../models/aci_vsan_pool.yml"))["aci_vsan_pool"]
}

resource "aci_vsan_pool" "n267" {
  alloc_mode  = local.m_267["alloc_mode"]
  annotation  = local.m_267["annotation"]
  description = local.m_267["description"]
  name        = local.m_267["name"]
  name_alias  = local.m_267["name_alias"]
}
