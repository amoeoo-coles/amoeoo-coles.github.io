# 314 · data source aci_eigrp_address_family_context · 3. Tenant and networking
# Data source for ACI EIGRP Address Family Context
# APIC class: eigrpCtxAfPol · DN: uni/tn-{name}/eigrpCtxAfP-{name}
# Reads models/data_aci_eigrp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_314 = yamldecode(file("${path.module}/../models/data_aci_eigrp_address_family_context.yml"))["data_aci_eigrp_address_family_context"]
}

data "aci_eigrp_address_family_context" "n314" {
  name      = local.m_314["name"]
  parent_dn = local.m_314["parent_dn"]
}

output "n314_data_aci_eigrp_address_family_context_id" {
  value = data.aci_eigrp_address_family_context.n314.id
}
