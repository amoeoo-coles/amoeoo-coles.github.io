# 639 · resource aci_cloud_cidr_pool · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud CIDR Pool
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_cidr_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_639 = yamldecode(file("${path.module}/../models/aci_cloud_cidr_pool.yml"))["aci_cloud_cidr_pool"]
}

resource "aci_cloud_cidr_pool" "n639" {
  addr                     = local.m_639["addr"]
  annotation               = local.m_639["annotation"]
  cloud_context_profile_dn = local.m_639["cloud_context_profile_dn"]
  description              = local.m_639["description"]
  name_alias               = local.m_639["name_alias"]
  primary                  = local.m_639["primary"]
}
