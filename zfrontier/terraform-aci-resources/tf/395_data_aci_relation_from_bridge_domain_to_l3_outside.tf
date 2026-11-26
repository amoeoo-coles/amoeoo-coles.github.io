# 395 · data source aci_relation_from_bridge_domain_to_l3_outside · 3. Tenant and networking
# Data source for ACI Relation From Bridge Domain To L3 Outside
# APIC class: fvRsBDToOut · DN: uni/tn-{name}/BD-{name}/rsBDToOut-{tnL3extOutName} | uni/tn-{name}/rsBDToOut-{tnL3extOutName} | uni/tn-{name}/svcBD-{name}/rsBDToOut-{tnL3extOutName}
# Reads models/data_aci_relation_from_bridge_domain_to_l3_outside.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_395 = yamldecode(file("${path.module}/../models/data_aci_relation_from_bridge_domain_to_l3_outside.yml"))["data_aci_relation_from_bridge_domain_to_l3_outside"]
}

data "aci_relation_from_bridge_domain_to_l3_outside" "n395" {
  l3_outside_name = local.m_395["l3_outside_name"]
  parent_dn       = local.m_395["parent_dn"]
}

output "n395_data_aci_relation_from_bridge_domain_to_l3_outside_id" {
  value = data.aci_relation_from_bridge_domain_to_l3_outside.n395.id
}
