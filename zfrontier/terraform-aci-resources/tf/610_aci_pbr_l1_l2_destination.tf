# 610 · resource aci_pbr_l1_l2_destination · 5. L4-L7 service graphs
# Manages ACI Destination of L1/L2 Redirected Traffic
# APIC class: not collected · DN: not collected
# Reads models/aci_pbr_l1_l2_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_610 = yamldecode(file("${path.module}/../models/aci_pbr_l1_l2_destination.yml"))["aci_pbr_l1_l2_destination"]
}

resource "aci_pbr_l1_l2_destination" "n610" {
  annotation                                  = local.m_610["annotation"]
  description                                 = local.m_610["description"]
  destination_name                            = local.m_610["destination_name"]
  mac                                         = local.m_610["mac"]
  name                                        = local.m_610["name"]
  name_alias                                  = local.m_610["name_alias"]
  pod_id                                      = local.m_610["pod_id"]
  policy_based_redirect_dn                    = local.m_610["policy_based_redirect_dn"]
  relation_vns_rs_l1_l2_redirect_health_group = local.m_610["relation_vns_rs_l1_l2_redirect_health_group"]
  relation_vns_rs_to_c_if                     = local.m_610["relation_vns_rs_to_c_if"]
}
