# 603 · data source aci_destination_of_redirected_traffic · 5. L4-L7 service graphs
# Data source for ACI Destination of redirected traffic
# APIC class: not collected · DN: not collected
# Reads models/data_aci_destination_of_redirected_traffic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_603 = yamldecode(file("${path.module}/../models/data_aci_destination_of_redirected_traffic.yml"))["data_aci_destination_of_redirected_traffic"]
}

data "aci_destination_of_redirected_traffic" "n603" {
  annotation                            = local.m_603["annotation"]
  description                           = local.m_603["description"]
  dest_name                             = local.m_603["dest_name"]
  ip                                    = local.m_603["ip"]
  ip2                                   = local.m_603["ip2"]
  mac                                   = local.m_603["mac"]
  name_alias                            = local.m_603["name_alias"]
  pod_id                                = local.m_603["pod_id"]
  relation_vns_rs_redirect_health_group = local.m_603["relation_vns_rs_redirect_health_group"]
  service_redirect_policy_dn            = local.m_603["service_redirect_policy_dn"]
}

output "n603_data_aci_destination_of_redirected_traffic_id" {
  value = data.aci_destination_of_redirected_traffic.n603.id
}
