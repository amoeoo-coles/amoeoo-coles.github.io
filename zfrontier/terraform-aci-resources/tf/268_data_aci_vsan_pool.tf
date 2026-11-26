# 268 · data source aci_vsan_pool · 2. Access policies
# Data source for ACI VSAN Pool
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vsan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_268 = yamldecode(file("${path.module}/../models/data_aci_vsan_pool.yml"))["data_aci_vsan_pool"]
}

data "aci_vsan_pool" "n268" {
  alloc_mode  = local.m_268["alloc_mode"]
  annotation  = local.m_268["annotation"]
  description = local.m_268["description"]
  name        = local.m_268["name"]
  name_alias  = local.m_268["name_alias"]
}

output "n268_data_aci_vsan_pool_id" {
  value = data.aci_vsan_pool.n268.id
}
