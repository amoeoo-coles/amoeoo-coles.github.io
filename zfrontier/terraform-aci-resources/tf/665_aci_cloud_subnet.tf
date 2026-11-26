# 665 · resource aci_cloud_subnet · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Subnet
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_665 = yamldecode(file("${path.module}/../models/aci_cloud_subnet.yml"))["aci_cloud_subnet"]
}

resource "aci_cloud_subnet" "n665" {
  annotation                           = local.m_665["annotation"]
  cloud_cidr_pool_dn                   = local.m_665["cloud_cidr_pool_dn"]
  description                          = local.m_665["description"]
  ip                                   = local.m_665["ip"]
  name                                 = local.m_665["name"]
  name_alias                           = local.m_665["name_alias"]
  relation_cloud_rs_subnet_to_ctx      = local.m_665["relation_cloud_rs_subnet_to_ctx"]
  relation_cloud_rs_subnet_to_flow_log = local.m_665["relation_cloud_rs_subnet_to_flow_log"]
  scope                                = local.m_665["scope"]
  subnet_group_label                   = local.m_665["subnet_group_label"]
  usage                                = local.m_665["usage"]
  zone                                 = local.m_665["zone"]
}
