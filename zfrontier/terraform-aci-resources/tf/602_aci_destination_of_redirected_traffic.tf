# 602 · resource aci_destination_of_redirected_traffic · 5. L4-L7 service graphs
# Manages ACI Destination of redirected traffic
# APIC class: not collected · DN: not collected
# Reads models/aci_destination_of_redirected_traffic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_602 = yamldecode(file("${path.module}/../models/aci_destination_of_redirected_traffic.yml"))["aci_destination_of_redirected_traffic"]
}

resource "aci_destination_of_redirected_traffic" "n602" {
  annotation                            = local.m_602["annotation"]
  description                           = local.m_602["description"]
  dest_name                             = local.m_602["dest_name"]
  ip                                    = local.m_602["ip"]
  ip2                                   = local.m_602["ip2"]
  mac                                   = local.m_602["mac"]
  name_alias                            = local.m_602["name_alias"]
  pod_id                                = local.m_602["pod_id"]
  relation_vns_rs_redirect_health_group = local.m_602["relation_vns_rs_redirect_health_group"]
  service_redirect_policy_dn            = local.m_602["service_redirect_policy_dn"]
}
