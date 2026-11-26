# 436 · data source aci_l3_outside · 3. Tenant and networking
# Data source for ACI L3 Outside
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_436 = yamldecode(file("${path.module}/../models/data_aci_l3_outside.yml"))["data_aci_l3_outside"]
}

data "aci_l3_outside" "n436" {
  annotation  = local.m_436["annotation"]
  description = local.m_436["description"]
  name        = local.m_436["name"]
  name_alias  = local.m_436["name_alias"]
  tenant_dn   = local.m_436["tenant_dn"]
}

output "n436_data_aci_l3_outside_id" {
  value = data.aci_l3_outside.n436.id
}
