# 611 · data source aci_pbr_l1_l2_destination · 5. L4-L7 service graphs
# Data source for ACI Destination of L1/L2 Redirected Traffic
# APIC class: not collected · DN: not collected
# Reads models/data_aci_pbr_l1_l2_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_611 = yamldecode(file("${path.module}/../models/data_aci_pbr_l1_l2_destination.yml"))["data_aci_pbr_l1_l2_destination"]
}

data "aci_pbr_l1_l2_destination" "n611" {
  annotation                                  = local.m_611["annotation"]
  description                                 = local.m_611["description"]
  destination_name                            = local.m_611["destination_name"]
  mac                                         = local.m_611["mac"]
  name                                        = local.m_611["name"]
  name_alias                                  = local.m_611["name_alias"]
  pod_id                                      = local.m_611["pod_id"]
  policy_based_redirect_dn                    = local.m_611["policy_based_redirect_dn"]
  relation_vns_rs_l1_l2_redirect_health_group = local.m_611["relation_vns_rs_l1_l2_redirect_health_group"]
  relation_vns_rs_to_c_if                     = local.m_611["relation_vns_rs_to_c_if"]
}

output "n611_data_aci_pbr_l1_l2_destination_id" {
  value = data.aci_pbr_l1_l2_destination.n611.id
}
