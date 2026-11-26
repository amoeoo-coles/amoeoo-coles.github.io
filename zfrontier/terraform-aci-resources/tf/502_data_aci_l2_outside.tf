# 502 · data source aci_l2_outside · 3. Tenant and networking
# Data source for ACI L2 Outside
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l2_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_502 = yamldecode(file("${path.module}/../models/data_aci_l2_outside.yml"))["data_aci_l2_outside"]
}

data "aci_l2_outside" "n502" {
  annotation  = local.m_502["annotation"]
  description = local.m_502["description"]
  name        = local.m_502["name"]
  name_alias  = local.m_502["name_alias"]
  target_dscp = local.m_502["target_dscp"]
  tenant_dn   = local.m_502["tenant_dn"]
}

output "n502_data_aci_l2_outside_id" {
  value = data.aci_l2_outside.n502.id
}
